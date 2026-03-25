<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Attributes\Table;
use Illuminate\Database\Eloquent\Model;

#[Table('tbl_contrato')]
#[Table(key: 'nu_contrato', keyType: 'string', incrementing: false)]
class Contrato extends Model
{
    //
}
