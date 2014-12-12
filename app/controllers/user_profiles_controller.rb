class UserProfilesController < ApplicationController
  # GET /user_profiles
  # GET /user_profiles.json
  layout 'user_profile'
  def index
    @user_profile = UserProfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_profile }
    end
  end

  # GET /user_profiles/1
  # GET /user_profiles/1.json
  def show
    raise params.inspect
   @user_profile = UserProfile.find(params[:id])
    @user_profile.destroy

     redirect_to(:action=>'index')
    #sess = Patron::Session.new
    #  sess.base_url = "https://maps.googleapis.com/"
     #      res = sess.get "maps/api/place/textsearch/json?query=#{params[:text]}&sensor=true&key=AIzaSyAXRfKe3awvT9mFVx5J2ppYaMeWZ3KMkc4"
     # value =  res.body
      #@place= JSON.parse(value)["results"] 
       #render :layout=>false 


  end

  # GET /user_profiles/new
  # GET /user_profiles/new.json
  def new
    @user_profile = UserProfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_profile }
    end
  end

  # GET /user_profiles/1/edit
  def edit

   # @user_profile = UserProfile.find(params[:id])
     render :layout=>true
  end

  # POST /user_profiles
  # POST /user_profiles.json
  def create
          if params[:user_profile]
           @user_profile = UserProfile.new(params[:user_profile].merge(:user_id =>current_user.id )) 
           if @user_profile.save
           redirect_to(:action=>'index')
         end
       else
         redirect_to(:action=>'index')
       end

  end

  # PUT /user_profiles/1
  # PUT /user_profiles/1.json
  def update
    @user_profile = User.find(current_user.id)
    status=@user_profile.update_attributes(:username=>params[:user][:username])
    redirect_to(:action=>'index')
    # respond_to do |format|
    #   if @user_profile.update_attributes(params[:user_profile])
    #     format.html { redirect_to @user_profile, notice: 'User profile was successfully updated.' }
    #     format.json { head :ok }
    #   else
    #     format.html { render action: "edit" }
    #     format.json { render json: @user_profile.errors, status: :unprocessable_entity }
    #   end
    #end
  end

  # DELETE /user_profiles/1
  # DELETE /user_profiles/1.json
  def destroy
    raise params.inspect
    @user_profile = UserProfile.find(params[:id])
    @user_profile.destroy

    respond_to do |format|
      format.html { redirect_to user_profiles_url }
      format.json { head :ok }
    end
  end

  def signout
    status=current_user.update_attributes(:status=>false)
    resource_name=:user
    redirect_path = after_sign_out_path_for(resource_name)
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    #set_flash_message :notice, :signed_out if signed_out && is_navigational_format?

    # We actually need to hardcode this as Rails default responder doesn't
    # support returning empty response on GET request

      redirect_to(root_url)
      end

      def upload_photo
       # raise params[:image][:avatar].inspect
        new_image=Image.new(:user_id=>current_user.id,:avatar=>params[:image][:avatar])
        @image=new_image.save!
         redirect_to(:action=>'index')
      end
end
