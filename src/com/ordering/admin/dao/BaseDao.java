package com.ordering.admin.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface BaseDao<T> {
	/**   
     * 保存指定实体类   
     *    
     * @param entityobj   
     *            实体类   
     */   
    public  void save(T entity);  
    /**
     * 根据sql删除数据
     * @param sql
     * @param params
     */
    public void deleteBySql(String sql, List<Object> params);
    /**
     * 保存log日志
     * @param entity
     */
    public void saveLog(T entity);
      
    public List<T> findSql(String sql,Class<T> entityClass);
      /**   
     * 删除指定实体   
     *    
     * @param entityobj   
     *            实体类   
     */    
    public void delete(T entity);  
      
      
     /** * 
     * 删除实体 
     * @param id 实体的ID 
     */  
    public void deleteById(Class<T> entityClass,Serializable id);  
      
      
    /**   
    * 更新或保存指定实体   
    *    
    * @param entity 实体类   
    */   
    public void saveorupdate(T entity);  
      
      
     /** * 
     * 更新实体 
     * 可用于添加、修改、删除操作 
     * @param hql 更新的HQL语句 
     * @param params 参数,可有项目或多项目,代替Hql中的"?"号 
     */  
    public void update(final String hql,final List<Object> params);
    
    /** * 
     * 更新数据
     * 可用于更新对象操作（只更新map中存储的值）
     * @param entityClass 需要更新的实体
     * @param params 需要跟新的数据   key:更新的对象属性，value：更新的对象值
     * @param id 需要更新的条件值
     * @param idName 需要更新的的条件名称
     */ 
    public void updateBySelective(Class<T> entityClass,Map<String,Object> params,String id,String idName);
      
    /**   
     * 获取所有实体集合   
     *    
     * @param entityClass   
     *            实体   
     * @return 集合   
     */    
    public List<T> findHqlByPage(String hql,List<Object> params,int start, int limit);  
    /**   
     * 查找指定PK实体类对象   
     *    
     * @param id   
     *               
     * @return 实体对象   
     */     
    public T findById(Class<T> entityClass,Serializable id);  
      
    /** * 
     * 按HQL条件查询列表 
     * @param hql 查询语句,支持连接查询和多条件查询 
     * @param params 参数数组,代替hql中的"?"号 
     * @return 结果集List 
     */  
     
    public List<T> findByHql(String hql,List<Object>  params);  
      
      
    /**   
     * 查询指定HQL语句的分页数据集合   
     *    
     * @param hsql   
     *            HQL语句   
     * @param start   
     *            开始记录号   
     * @param limit   
     *            最大记录号   
     * @return 分页数据集合   
     * @throws Exception   
     *             抛出异常   
     */    
    public List<T> findByPage(Class<T> entityClass,int start,int limit) ;  
      
      
    /** 
     * 获得总记录数 用sql
     */  
    public Integer getTotalCount(String sql);  
    /**
     * 获得总记录数 用hql
     * @param hql
     * @param params
     * @return
     */
    public Integer getPageCount(String hql,List<Object> params);  
  
    /**
     * 根据某字段查询
     * @param entityClass 
     * @param paramName 参数名
     * @param operation  操作
     * @param paramValue  参数值
     * @return
     */
    public List<T> findByParam (Class<T> entityClass , String paramName,String operation,Object paramValue);
}
