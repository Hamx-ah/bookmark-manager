class MarksController < ApplicationController
    layout "marks"
    def index
        @marks = Mark.where(user_id: cookies[:user_id])
    end

    def new
        flash[:error] = nil
        @user_id = cookies[:user_id]
        @mark = Mark.new
        @categories = [ "books", "movies", "music", "food", "travel", "games", "courses", "educational", "other" ]
    end
    def create
        mark_params[:user_id] = mark_params[:user_id].to_i
        @mark = Mark.new(mark_params)
        if @mark.save
            redirect_to marks_path
        else
            flash[:error] = @mark.errors.full_messages
            redirect_to new_mark_path
        end
    end
    def show
        @mark = Mark.find(params[:id])
        p "=========================================================="
        p cookies[:user_id]
        p @mark.user_id
        p "=========================================================="
        if @mark.user_id == cookies[:user_id].to_i
            @mark = Mark.find(params[:id])
        else
            redirect_to marks_path
        end
    end
    def edit
        @mark = Mark.find(params[:id])
        user_id = cookies[:user_id]
        if user_id.to_i == @mark.user_id
        @categories = [ "books", "movies", "music", "food", "travel", "games", "courses", "educational", "other" ]
        @user_id = cookies[:user_id]
        else
            redirect_to marks_path
        end
    end
    def update
        @mark = Mark.update(mark_params)
        redirect_to mark_path(@mark)
    end
    def destroy
        @mark = Mark.find(params[:id])
        user_id = cookies[:user_id]
        if user_id.to_i == @mark.user_id
            @mark.destroy
            redirect_to marks_path
        else
            redirect_to marks_path
        end
    end
  def search_by_filter
    @marks = Mark.where("category LIKE ?", "%#{params[:category]}%").where(user_id: cookies[:user_id])
    render "index"
  end
    def search_by_title
        @marks = Mark.where("name LIKE ?", "%#{params[:title]}%").where(user_id: cookies[:user_id])
        render "index"
    end
    private
    def mark_params
        params.require(:mark).permit(:name, :url, :category, :tags, :description, :user_id)
    end
end
