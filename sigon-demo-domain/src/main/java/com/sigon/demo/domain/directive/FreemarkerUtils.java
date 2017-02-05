package com.sigon.demo.domain.directive;

import freemarker.core.Environment;
import freemarker.template.*;
import freemarker.template.utility.DeepUnwrap;
import org.apache.commons.beanutils.ConvertUtilsBean;
import org.apache.commons.beanutils.Converter;
import org.apache.commons.beanutils.converters.ArrayConverter;
import org.apache.commons.beanutils.converters.DateConverter;
import org.danny.common.util.EnumConverter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.Assert;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import javax.annotation.Resource;
import java.io.*;
import java.util.Date;
import java.util.Map;

/**
 * Created by Administrator on 2016/11/18.
 */
public class FreemarkerUtils {

    private static final Logger logger = LoggerFactory.getLogger(FreemarkerUtils.class);

    @Resource(name = "freeMarkerConfigurer")
    private FreeMarkerConfigurer freemarkerCfg;

    private static final ConvertUtilsBean convertUtils;

    static {
        convertUtils = new ConvertUtilsBean() {
            @Override
            public String convert(Object value) {
                if (value != null) {
                    Class<?> type = value.getClass();
                    if (type.isEnum() && super.lookup(type) == null) {
                        super.register(new EnumConverter(type), type);
                    } else if (type.isArray() && type.getComponentType().isEnum()) {
                        if (super.lookup(type) == null) {
                            ArrayConverter arrayConverter = new ArrayConverter(type, new EnumConverter(type.getComponentType()), 0);
                            arrayConverter.setOnlyFirstToString(false);
                            super.register(arrayConverter, type);
                        }
                        Converter converter = super.lookup(type);
                        return ((String) converter.convert(String.class, value));
                    }
                }
                return super.convert(value);
            }

            @SuppressWarnings("rawtypes")
            @Override
            public Object convert(String value, Class clazz) {
                if (clazz.isEnum() && super.lookup(clazz) == null) {
                    super.register(new EnumConverter(clazz), clazz);
                }
                return super.convert(value, clazz);
            }

            @SuppressWarnings("rawtypes")
            @Override
            public Object convert(String[] values, Class clazz) {
                if (clazz.isArray() && clazz.getComponentType().isEnum() && super.lookup(clazz.getComponentType()) == null) {
                    super.register(new EnumConverter(clazz.getComponentType()), clazz.getComponentType());
                }
                return super.convert(values, clazz);
            }

            @SuppressWarnings("rawtypes")
            @Override
            public Object convert(Object value, Class targetType) {
                if (super.lookup(targetType) == null) {
                    if (targetType.isEnum()) {
                        super.register(new EnumConverter(targetType), targetType);
                    } else if (targetType.isArray() && targetType.getComponentType().isEnum()) {
                        ArrayConverter arrayConverter = new ArrayConverter(targetType, new EnumConverter(targetType.getComponentType()), 0);
                        arrayConverter.setOnlyFirstToString(false);
                        super.register(arrayConverter, targetType);
                    }
                }
                return super.convert(value, targetType);
            }
        };

        DateConverter dateConverter = new DateConverter();
        dateConverter.setPatterns(CommonAttributes.DATE_PATTERNS);
        convertUtils.register(dateConverter, Date.class);
    }

    public static <T> T getParameter(String name, Class<T> type, Map<String, TemplateModel> params) throws TemplateModelException {
        Assert.hasText(name);
        Assert.notNull(type);
        Assert.notNull(params);
        TemplateModel templateModel = params.get(name);
        if (templateModel == null) {
            return null;
        }
        Object value = DeepUnwrap.unwrap(templateModel);
        return (T) convertUtils.convert(value, type);
    }
    public String build(String ftlPath, Map<String, Object> model) throws IOException {

        //model.put("messageUtil", messageUtil);
        FileOutputStream fileOutputStream = null;
        OutputStreamWriter outputStreamWriter = null;
        StringWriter writer = null;
        try {
            Template template = freemarkerCfg.getConfiguration().getTemplate(ftlPath);
            writer = new StringWriter();
            template.process(model, writer);
            return writer.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String process(String template, Map<String, ?> model, Configuration configuration) throws IOException, TemplateException {
        if (template == null) {
            return null;
        }
        if (configuration == null) {
            configuration = new Configuration();
        }
        StringWriter out = new StringWriter();
        new Template("template", new StringReader(template), configuration).process(model, out);
        return out.toString();
    }

    public static void setVariable(String name, Object value, Environment env) throws TemplateException {
        Assert.hasText(name);
        Assert.notNull(env);
        if (value instanceof TemplateModel) {
            env.setVariable(name, (TemplateModel) value);
        } else {
            env.setVariable(name, ObjectWrapper.BEANS_WRAPPER.wrap(value));
        }
    }

    public static void setVariables(Map<String, Object> variables, Environment env) throws TemplateException {
        Assert.notNull(variables);
        Assert.notNull(env);
        for (Map.Entry<String, Object> entry : variables.entrySet()) {
            String name = entry.getKey();
            Object value = entry.getValue();
            if (value instanceof TemplateModel) {
                env.setVariable(name, (TemplateModel) value);
            } else {
                env.setVariable(name, ObjectWrapper.BEANS_WRAPPER.wrap(value));
            }
        }
    }


    public static TemplateModel getVariable(String name, Environment env) throws TemplateModelException {
        Assert.hasText(name);
        Assert.notNull(env);
        return env.getVariable(name);
    }
}
