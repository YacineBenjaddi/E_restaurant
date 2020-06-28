<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Comments
 * 
 * @property int $id
 * @property string $title
 * @property string $texto
 * @property string $name
 * @property int $rating
 * @property int $id_restaurant
 * 
 * @property Restaurant $restaurant
 * @property User $user
 *
 * @package App\Models
 */
class Comments extends Model
{
	protected $table = 'comments';
	protected $primaryKey = 'id';
	public $timestamps = false;

	protected $casts = [
		'id_restaurant' => 'int',
		'rating' => 'int'
	];

	protected $fillable = [
		'title',
		'texto',
		'name',
		'rating',
		'id_restaurant'
		
	];

	public function restaurant()
	{
		return $this->belongsTo(Restaurant::class, 'id_restaurant');
	}

	public function user()
	{
		return $this->belongsTo(User::class, 'name');
	}
}
