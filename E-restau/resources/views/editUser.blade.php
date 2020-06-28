@include('inc.header')
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<form class="form-horizontal" method="POST" action="{{ url('/editU',array($users->id_user)) }}">
					<input type="hidden" name="_token" value="{{ csrf_token() }}">
				  <fieldset>
				    
				    <div class="form-group">
				      <label  class="col-lg-2 control-label">nom</label>
				      <div class="col-lg-10">
				      	<input type="text" name="last_name" class="form-control" id="last_name" placeholder="last_name" value="<?php echo $users->last_name; ?>">
				      </div>
				 	</div>
				 	<div class="form-group">
				      <label  class="col-lg-2 control-label">prenom</label>
				      <div class="col-lg-10">
				      	
				      	<input type="text" name="first_name" class="form-control" placeholder="first_name" id="first_name" value="<?php echo $users->first_name; ?>">
				      </div>
				 	</div>
				
				 	
				 	<div class="form-group">
				      <label  class="col-lg-2 control-label">email</label>
				      <div class="col-lg-10">
				      	
				      	<input type="text" name="email" class="form-control" placeholder="email"  id="email" value="<?php echo $users->email; ?>">
				      </div>
				 	</div>

				 	
				 

				 	<div class="form-group">
				      <label  class="col-lg-2 control-label">password</label>
				      <div class="col-lg-10">
				      	
				      	<input type="text" name="password" class="form-control" placeholder="password" id="password" value="<?php echo $users->password; ?>">
				      </div>
				 	</div>

				 	<div class="form-group">
				      <label  class="col-lg-2 control-label">profil</label>
				      <div class="col-lg-10">
				      	
				      	<input type="text" name="profile" class="form-control" placeholder="profil" id="profile" value="<?php echo $users->profile; ?>">
				      </div>
				 	</div>

				 	<div class="form-group">
				 		<div class="col-lg-10 col-lg-offset-2">
				 			<button type="submit" class="btn btn-primary">Update</button>


				 			<a href="{{ url('/dashboardadmin')}}" class="btn btn-primary">Back</a>
				 		</div>
				 	</div>
				  </fieldset>
				</form>
			</div>
		</div>
	</div>
@include('inc.footer')