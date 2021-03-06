class ArticlesController < ApplicationController


def index
	@article = Article.all

end
def new
   @article = Article.new
end

def edit
     @article = Article.find(params[:id])
end

def update
	@article = Article.find(params[:id])
	if @article.update(article_params)
	flash[:notice] = "Edited and updated"
	redirect_to article_path(@article)
else
	render 'edit'
end
end

def create
     @article = Article.new(article_params)
      if @article.save
        flash[:notice] = "Article was successfully created"
        redirect_to article_path(@article)
      else
        render 'new'
        end
      end

#	 @article.save
#	redirect_to article_path(@article)
 

def show
    @article = Article.find(params[:id])
end

def destroy
	@article = Article.find(params[:id])
  @article.destroy
  flash[:notice] = "Article was sucessfully deleted"
  redirect_to articles_path

end



private
def article_params
    params.require(:article).permit(:title, :description)
	end


end
