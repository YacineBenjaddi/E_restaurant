@include('inc.header')
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<form class="form-horizontal" enctype="multipart/form-data" method="post" action="{{ url('/createRe')}} ">
				<input type="hidden" name="_token" value="{{ csrf_token() }}">
				  <fieldset>
				   <div class="form-group"><br><br>
				     <div class="col-lg-6">
						<input type="text" name="name" class="form-control" id="name" placeholder="name" >
				      </div>
				 	</div>
				 	<div class="form-group">
				     
				        <div class="col-lg-6 custom-file">
				      	<label class="custom-file-label">Choose image</label>
               	<input type="file" name="imagepath" class="custom-file-input" >

				      </div>
				 	</div>

				 	<div class="form-group">
				    
				      <div class="col-lg-6">
				      	
				      	<input type="text" name="category" class="form-control" placeholder="category"  id="category" >
				      </div>
				 	</div>
				 	<div class="form-group">
				    
				      <div class="col-lg-6">
				      	
				      	<input type="text" name="discount" class="form-control" placeholder="discount" id="discount" >
				      </div>
				 	</div>
				 		<div class="form-group">
				     
				      <div class="col-lg-6">
				      	
			<input type="text" name="ratings" class="form-control" placeholder="ratings" id="ratings" >
				      </div>
				 	</div>
					
				 	<div class="form-group">
				     
				     <div class="col-lg-6">
			
				   	<input type="text" name="info" class="form-control" placeholder="information" id="info">
				      </div>
				 	</div>
				 	
				 		<div class="form-group">
				     
				      <div class="col-lg-6">
				      	
				   	<input type="text" name="latitude" class="form-control" placeholder="latitude" id="latitude" >
				      </div>
				 	</div>

				 	<div class="form-group">
				     
				      <div class="col-lg-6">
				      	
	<input type="text" name="longitude" class="form-control" placeholder="longitude" id="longitude" >
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