$(document).ready ->

  $('#developers').select2
    dropdownParent: $('#project_modal .modal-content')
    # placeholder: 'Select Developers'
    # allowClear: true
 


  # $('#project_modal').on 'show.bs.modal', ->
  #   console.log('model opened')
  #   debugger
  #   $('#developers').select2
  #     placeholder: 'Select Developers'
  #     allowClear: true

window.create_project =()->
  $('#project_modal').modal('show')
  $.get('/projects/new')

window.create_todo =(project_id)->
  $('#todo_modal').modal('show')
  $.get("/projects/"+project_id+ "/todos/new")
    # debugger
    # $('#developers').select2
    #   placeholder: 'Select Developers'
    #   allowClear: true