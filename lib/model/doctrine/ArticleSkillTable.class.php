<?php


class ArticleSkillTable extends myDoctrineTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('ArticleSkill');
    }
}