class CatRentalRequestsController < ApplicationController
   def new
     @cat_rental_request = CatRentalRequest.new
     @cats = Cat.all
     render :new
   end
   
   def create
     @cat_rental_request = CatRentalRequest.new(rental_params)
     if @cat_rental_request.save 
       redirect_to cat_rental_request_url(@cat_rental_request)
     else 
       render :new
     end 
   end
   
   def show
     @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
     render :show
   end
   
   private
   def rental_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
   end
end