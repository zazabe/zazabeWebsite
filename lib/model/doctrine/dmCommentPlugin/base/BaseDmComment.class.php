<?php

/**
 * BaseDmComment
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property string $record_model
 * @property integer $record_id
 * @property string $author_name
 * @property string $author_email
 * @property string $author_website
 * @property clob $body
 * @property boolean $is_active
 * 
 * @method string    getRecordModel()    Returns the current record's "record_model" value
 * @method integer   getRecordId()       Returns the current record's "record_id" value
 * @method string    getAuthorName()     Returns the current record's "author_name" value
 * @method string    getAuthorEmail()    Returns the current record's "author_email" value
 * @method string    getAuthorWebsite()  Returns the current record's "author_website" value
 * @method clob      getBody()           Returns the current record's "body" value
 * @method boolean   getIsActive()       Returns the current record's "is_active" value
 * @method DmComment setRecordModel()    Sets the current record's "record_model" value
 * @method DmComment setRecordId()       Sets the current record's "record_id" value
 * @method DmComment setAuthorName()     Sets the current record's "author_name" value
 * @method DmComment setAuthorEmail()    Sets the current record's "author_email" value
 * @method DmComment setAuthorWebsite()  Sets the current record's "author_website" value
 * @method DmComment setBody()           Sets the current record's "body" value
 * @method DmComment setIsActive()       Sets the current record's "is_active" value
 * 
 * @package    zazabe
 * @subpackage model
 * @author     Michel Meyer
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseDmComment extends myDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('dm_comment');
        $this->hasColumn('record_model', 'string', 255, array(
             'type' => 'string',
             'notnull' => true,
             'length' => 255,
             ));
        $this->hasColumn('record_id', 'integer', null, array(
             'type' => 'integer',
             'notnull' => true,
             ));
        $this->hasColumn('author_name', 'string', 255, array(
             'type' => 'string',
             'notnull' => true,
             'length' => 255,
             ));
        $this->hasColumn('author_email', 'string', 255, array(
             'type' => 'string',
             'notnull' => false,
             'length' => 255,
             ));
        $this->hasColumn('author_website', 'string', 255, array(
             'type' => 'string',
             'notnull' => false,
             'extra' => 'link',
             'length' => 255,
             ));
        $this->hasColumn('body', 'clob', null, array(
             'type' => 'clob',
             'notnull' => true,
             ));
        $this->hasColumn('is_active', 'boolean', null, array(
             'type' => 'boolean',
             'notnull' => true,
             'default' => true,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $timestampable0 = new Doctrine_Template_Timestampable();
        $this->actAs($timestampable0);
    }
}