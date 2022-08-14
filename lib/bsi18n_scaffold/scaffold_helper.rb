module Bsi18nScaffold
  module ScaffoldHelper
    extend ActiveSupport::Concern

    included do
      helper ScaffoldHelper if respond_to?(:helper)
      if respond_to?(:helper_method)
        ScaffoldHelper.instance_methods(:false).each do |method|
          helper_method method
        end
      end
    end

    def submit_button(instance)
      if instance.persisted?
        submit_update_button(instance)
      else
        submit_create_button(instance)
      end
    end

    def submit_update_button(instance)
      button_tag(class: 'btn btn-primary') do
        (pad_text(I18n.t("template.update")) + icon('save2'))
      end
    end

    def submit_create_button(instance)
      button_tag(class: 'btn btn-primary') do
        (pad_text(I18n.t("template.create")) + icon('save2'))
      end
    end

    def to_index_button(klass)
      link_to(url_for(klass), class: 'btn btn-secondary', only_path: true) do
        (pad_text(I18n.t("template.back_to_index")) + icon('card-list'))
      end
    end

    def to_new_button(klass)
      link_to(new_class_path(klass), class: 'btn btn-secondary', only_path: true) do
        pad_text(I18n.t("template.new_model", model: klass.model_name.human)) + icon('plus-square')
      end
    end

    def to_edit_button(instance)
      link_to(edit_instance_path(instance), class: 'btn btn-secondary btn-to-edit') do
        (pad_text(I18n.t('template.edit')) + icon('pencil-square'))
      end
    end

    def to_show_button(instance)
      link_to( instance, class: 'btn btn-secondary btn-to-show') do
        pad_text(I18n.t('template.show')) + icon('eye')
      end
    end

    def destroy_button(instance)
      button_to(
        instance,
        method: :delete,
        class: 'btn btn-danger btn-to-destroy',
        form: { data: { turbo_confirm: I18n.t('template.confirm_delete') } }) do
          pad_text(I18n.t('template.delete')) + icon('trash')
        end
    end

    def destroy_icon(instance)
      button_to tag.i(class: 'fs-5 bi-trash danger'),
        instance,
        class: 'btn btn-link link-danger p-0',
        method: :delete,
        form: { data: { turbo_confirm: I18n.t('template.confirm_delete') } } 
    end

    def to_show_icon(instance)
      link_to tag.i(class: 'fs-5 bi-eye'), instance
    end

    def to_edit_icon(instance)
      link_to tag.i(class: 'fs-5 bi-pencil-square'), 
        edit_instance_path(instance)
    end

    def edit_instance_path(instance, opts={})
      send("edit_#{instance.class.name.underscore}_path".to_sym, instance, opts)
    end

    def new_class_path(klass, opts={})
      send("new_#{klass.name.underscore}_path".to_sym, opts)
    end

    def instance_path_for(operation, instance, opts={})
      send(
        "#{operation}_#{instance.class.name.underscore}_path".to_sym, instance, opts)
    end

    def pad_text(text, klass='pe-2')
      tag.span(text, class: klass)
    end

    # Show icon using sprite.  <i> tag based display-as-font push them up and 
    # down, add spacing.
    def icon(name, width=15, height=15)
      tag.svg(class: 'bi', width: width, height: height, fill: "currentColor") do
        tag.use('xlink:href': image_path("bi/bootstrap-icons.svg##{name}"))
      end
    end

    def invalid_feedback(form, col_name)
      field = col_to_attr(col_name)
      object = form.object
      return unless object&.errors&.attribute_names&.include?(field)
      object.errors[field].map do |msg|
        tag.div(class: 'invalid-feedback') { msg }
      end.join.html_safe
    end

    def invalid_class(form, col_name, class_string)
      field = col_to_attr(col_name)
      object = form.object
      return class_string unless object&.errors&.attribute_names&.include?(field)
      class_string + ' is-invalid'
    end

    # Get attribute name from column name.  Errors are on the attribute name
    # (e.g. "country") but params are keyed on the column name (e.g.
    # country_id).
    def col_to_attr(column)
      column.to_s.sub(/_id\z/,'').to_sym
    end
    private :col_to_attr

    # rails flashes should be :error, :warning, :notice
    def flash_type_to_bootstrap(type)
      {error: 'danger', warning: 'warning'}[type.to_sym] || 'success'
    end
  end
end
