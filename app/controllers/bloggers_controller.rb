class BloggersController < ApplicationController
    
    def new
        @blogger = Blogger.new
    end

    def show
        @blogger = Blogger.find(params[:id])
    end

    def create
        blogger = Blogger.create(blogger_params)
        if blogger.save
            redirect_to blogger
        else
            flash[:errors] = blogger.errors.full_messages
            redirect_to new_blogger_path
        end
    end

    private
    
    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end
end
