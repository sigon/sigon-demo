package com.sigon.demo.domain.directive;

import freemarker.core.Environment;
import freemarker.template.*;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.danny.common.freemarker.util.FreemarkerUtils;
import org.danny.common.pagination.Filter;
import org.danny.common.pagination.Order;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.beans.PropertyDescriptor;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/11/18.
 */
public abstract class BaseDirective implements TemplateDirectiveModel {
    private static final Logger logger = LoggerFactory.getLogger(BaseDirective.class);
    private static final String USE_CACHE_PARAMETER_NAME = "useCache";
    private static final String CACHE_REGION_PARAMETER_NAME = "cacheRegion";
    private static final String ID_PARAMETER_NAME = "id";
    private static final String COUNT_PARAMETER_NAME = "count";
    private static final String ORDER_BY_PARAMETER_NAME = "orderBy";
    private static final String ORDER_BY_ITEM_SEPARATOR = "\\s*,\\s*";
    private static final String ORDER_BY_FIELD_SEPARATOR = "\\s+";

    protected boolean useCache(Environment env, Map<String, TemplateModel> params) throws TemplateModelException {
        Boolean useCache = FreemarkerUtils.getParameter(USE_CACHE_PARAMETER_NAME, Boolean.class, params);
        return useCache != null ? useCache : true;
    }

    protected String getCacheRegion(Environment env, Map<String, TemplateModel> params) throws TemplateModelException {
        String cacheRegion = FreemarkerUtils.getParameter(CACHE_REGION_PARAMETER_NAME, String.class, params);
        return cacheRegion != null ? cacheRegion : env.getTemplate().getName();
    }

    protected Long getId(Map<String, TemplateModel> params) throws TemplateModelException {
        return FreemarkerUtils.getParameter(ID_PARAMETER_NAME, Long.class, params);
    }

    protected Integer getCount(Map<String, TemplateModel> params) throws TemplateModelException {
        return FreemarkerUtils.getParameter(COUNT_PARAMETER_NAME, Integer.class, params);
    }

    protected List<Filter> getFilters(Map<String, TemplateModel> params, Class<?> type, String... ignoreProperties) throws TemplateModelException {
        List<Filter> filters = new ArrayList<Filter>();
        PropertyDescriptor[] propertyDescriptors = PropertyUtils.getPropertyDescriptors(type);
        for (PropertyDescriptor propertyDescriptor : propertyDescriptors) {
            String propertyName = propertyDescriptor.getName();
            Class<?> propertyType = propertyDescriptor.getPropertyType();
            if (!ArrayUtils.contains(ignoreProperties, propertyName) && params.containsKey(propertyName)) {
                Object value = FreemarkerUtils.getParameter(propertyName, propertyType, params);
                filters.add(Filter.eq(propertyName, value));
            }
        }
        return filters;
    }

    protected List<Order> getOrders(Map<String, TemplateModel> params, String... ignoreProperties) throws TemplateModelException {
        String orderBy = StringUtils.trim(FreemarkerUtils.getParameter(ORDER_BY_PARAMETER_NAME, String.class, params));
        List<Order> orders = new ArrayList<Order>();
        if (StringUtils.isNotEmpty(orderBy)) {
            String[] orderByItems = orderBy.split(ORDER_BY_ITEM_SEPARATOR);
            for (String orderByItem : orderByItems) {
                if (StringUtils.isNotEmpty(orderByItem)) {
                    String property = null;
                    Order.Direction direction = null;
                    String[] orderBys = orderByItem.split(ORDER_BY_FIELD_SEPARATOR);
                    if (orderBys.length == 1) {
                        property = orderBys[0];
                    } else if (orderBys.length >= 2) {
                        property = orderBys[0];
                        try {
                            direction = Order.Direction.valueOf(orderBys[1]);
                        } catch (IllegalArgumentException e) {
                            continue;
                        }
                    } else {
                        continue;
                    }
                    if (!ArrayUtils.contains(ignoreProperties, property)) {
                        orders.add(new Order(property, direction));
                    }
                }
            }
        }
        return orders;
    }

    protected void setLocalVariable(String name, Object value, Environment env, TemplateDirectiveBody body) throws TemplateException, IOException {
        TemplateModel sourceVariable = FreemarkerUtils.getVariable(name, env);
        FreemarkerUtils.setVariable(name, value, env);
        body.render(env.getOut());
        FreemarkerUtils.setVariable(name, sourceVariable, env);
    }

    protected void setLocalVariables(Map<String, Object> variables, Environment env, TemplateDirectiveBody body) throws TemplateException, IOException {
        Map<String, Object> sourceVariables = new HashMap<String, Object>();
        for (String name : variables.keySet()) {
            TemplateModel sourceVariable = FreemarkerUtils.getVariable(name, env);
            sourceVariables.put(name, sourceVariable);
        }
        FreemarkerUtils.setVariables(variables, env);
        body.render(env.getOut());
        FreemarkerUtils.setVariables(sourceVariables, env);
    }
}
