SimpleForm.setup do |config|
  config.wrappers :materialize_form, class: 'input-field', error_class: 'has_error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :input, class: 'validate'
    b.use :label
    b.use :error, wrap_with: { tag: :p, class: 'error-text'}
    b.use :hint,  wrap_with: { tag: :p, class: 'help-block' }
  end

  config.wrappers :text_area, class: 'input-field', error_class: 'has_error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :input, class: 'materialize-textarea'
    b.use :label
    b.use :error, wrap_with: { tag: :p , class: 'error-text'}
    b.use :hint,  wrap_with: { tag: :p, class: 'help-block' }
  end
end
