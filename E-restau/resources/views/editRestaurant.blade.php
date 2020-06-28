@include('inc.header')
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<form class="form-horizontal" enctype="multipart/form-data" method="POST" action="{{ url('/editRe',array($restaurants->id_restaurant)) }}">
					<input type="hidden" name="_token" value="{{ csrf_token() }}">
				  <fieldset>
				    
				    <div class="form-group"><br><br>
				      <label  class="col-lg-2 control-label">name</label>
				      <div class="col-lg-10">
				      	<input type="text" name="name" class="form-control" id="name" placeholder="name" value="<?php echo $restaurants->name; ?>">
				      </div>
				 	</div>
				 	<div class="form-group">
				 		 <label  class="col-lg-2 control-label">image</label>
				      <div class="col-lg-10">
				 	<img src="{{ asset($restaurants->imagepath) }}" width= "100px" height="100px" alt="Image"><br>
				 	 </div>
				 	</div>
				 	 	<div class="form-group">
				     
				        <div class="col-lg-6 custom-file">
				      	<label class="custom-file-label">Choose image</label>
               	<input type="file" name="imagepath" class="custom-file-input" >

				      </div>
				 	</div>
				
				 	
				 	<div class="form-group">
				      <label  class="col-lg-2 control-label">category</label>
				      <div class="col-lg-10">
				      	
				      	<input type="text" name="category" class="form-control" placeholder="category"  id="category" value="<?php echo $restaurants->category; ?>">
				      </div>
				 	</div>


				 	<div class="form-group">
				      <label  class="col-lg-2 control-label">discount</label>
				      <div class="col-lg-10">
				      	
				      	<input type="text" name="discount" class="form-control" placeholder="discount" id="discount" value="<?php echo $restaurants->discount; ?>">
				      </div>
				 	</div>

				 	<div class="form-group">
				      <label  class="col-lg-2 control-label">ratings</label>
				      <div class="col-lg-10">
				      	
				      	<input type="text" name="ratings" class="form-control" placeholder="ratings" id="ratings" value="<?php echo $restaurants->ratings; ?>">
				      </div>
				 	</div>

				 	<div class="form-group">
				      <label  class="col-lg-2 control-label">information</label>
				      <div class="col-lg-10">
				      	
				      	<input type="text" name="info" class="form-control" placeholder="info" id="info" value="<?php echo $restaurants->info; ?>">
				      </div>
				 	</div>

				 	<div class="form-group">
				      <label  class="col-lg-2 control-label">latitude</label>
				      <div class="col-lg-10">
				      	
				      	<input type="text" name="latitude" class="form-control" placeholder="latitude" id="latitude" value="<?php echo $restaurants->latitude; ?>">
				      </div>
				 	</div>

				 	<div class="form-group">
				      <label  class="col-lg-2 control-label">longitude</label>
				      <div class="col-lg-10">
				      	
				      	<input type="text" name="longitude" class="form-control" placeholder="longitude" id="longitude" value="<?php echo $restaurants->longitude; ?>">
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