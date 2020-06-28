@include('inc.header')
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<form class="form-horizontal" method="post" action="{{ url('/createU')}}">
				<input type="hidden" name="_token" value="{{ csrf_token() }}">
				  <fieldset>
				   <div class="form-group">
				      <label  class="col-lg-2 control-label">nom</label>
				      <div class="col-lg-10">
				      	<input type="text" name="nom" class="form-control" id="nom" placeholder="nom" >
				      </div>
				 	</div>
				 	<div class="form-group">
				      <label  class="col-lg-2 control-label">prenom</label>
				      <div class="col-lg-10">
				      	
				      	<input type="text" name="prenom" class="form-control" placeholder="prenom" id="prenom" >
				      </div>
				 	</div>
				 	

				 	<div class="form-group">
				      <label  class="col-lg-2 control-label">email</label>
				      <div class="col-lg-10">
				      	
				      	<input type="text" name="email" class="form-control" placeholder="email"  id="email" >
				      </div>
				 	</div>




				 	<div class="form-group">
				      <label  class="col-lg-2 control-label">password</label>
				      <div class="col-lg-10">
				      	
				      	<input type="password" name="password" class="form-control" placeholder="password" id="password" >
				      </div>
				 	</div>
				 		<div class="form-group">
				      <label  class="col-lg-2 control-label">profil</label>
				      <div class="col-lg-10">
				      	
				      	<input type="text" name="profil" class="form-control" placeholder="profil" id="profi" >
				      </div>
				 	</div>

				 	

				 	
				 	<div class="form-group">
				 		<div class="col-lg-10 col-lg-offset-2">
				 			<button type="submit" class="btn btn-primary">Submit</button>


				 			<a href="{{ url('/')}}" class="btn btn-primary">Back</a>
				 		</div>
				 	</div>
				  </fieldset>
				</form>
			</div>
		</div>
	</div>
@include('inc.footer')