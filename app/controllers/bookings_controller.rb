require "prawn"

class BookingsController < ApplicationController 
    before_action :authenticate_user! 
    def new
        @booking = Booking.new
    end
    
    def create
        @booking = Booking.new(booking_params)
        if @booking.save
            flash[:notice] = "Booking was successfully done !"
            redirect_to booking_path(@booking)            
        else
            render 'new' 
        end
        
    end

    def show 
        @booking = Booking.find_by(id: params[:id])
        if @booking == nil 
            flash[:notice] = "Booking not found !"
        end
    end

    def index
        @bookings = Booking.all
    end

    def destroy
        @booking = Booking.find(params[:id])
        if @booking
            @booking.destroy
            flash[:notice] = "Booking was successfully deleted !"
            redirect_to bookings_path
        else 
            flash[:notice] = "Booking not found !"
        end 
    end

    def download_pdf
        booking = Booking.find(params[:id])
        if booking 
            send_data generate_pdf(booking),
                filename: "ticket.pdf",
                type: "application/pdf"
        else  
            flash[:notice] = "Unable to dowload Ticket !"
    end
    
    private 
    def generate_pdf(booking)
        Prawn::Document.new do
          text "Movie Booking App", align: :center
          text "User email : #{booking.user.email}", align: :center
          text "Place : #{booking.place}", align: :center
          text "Movie : #{booking.movie}", align: :center
          text "Date : #{booking.date}", align: :center
          text "Time : #{booking.time}", align: :center
        end.render
      end

    private 
        def booking_params 
            params.require(:booking).permit(:place , :movie , :date , :time, :user_id, :payment_proof)
        end
end 