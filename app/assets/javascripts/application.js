//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$( document ).ready(function() {
  borderRadiusForAllProjects();
  getInputForUpdateProjectsName();
  getInputForUpdateTasksTarget();
  tasksDragAndDrop('.project-content');
});

function borderRadiusSetting(){
  $('.project-content').each(function(index){
    var height = $(this).css('height');
    if(height == '0px'){
      $(this).prev().css('border-radius', '0px 0px 13px 13px');
    }
  });
};

function borderRadiusForAllProjects() {
  $( '.project-add-task' ).each(function( index ) {
    borderRadiusSetting();
  });
}

function getInputForUpdateProjectsName(){
  $('.get-edit-input').click(function() {
    var index = $('.get-edit-input').index(this);
    getOneInputUpdate(index);
  });
};

function getOneInputUpdate(index) {
  $('.project-name').eq( index ).hide();
  $('.get-edit-input').eq( index ).hide();
  $('.project-edit-name').eq( index ).css('display', 'inline-block');
};

function getInputForUpdateTasksTarget(){
  $('.get-task-edit').click(function() {
    var index = $('.get-task-edit').index(this);
    getOneTasksInputUpdate(index);
  });
};

function getOneTasksInputUpdate(index) {
  $('.task-target').eq( index ).hide();
  $('.get-task-edit').eq( index ).hide();
  $('.get-tasks-input-submit').eq( index ).css('display', 'inline-block');
  $('.task-input-target').eq( index ).show();
};



//*******************************************

function tasksDragAndDrop(point) {
  var taskDrag = 'div.task-drag-drop';
  $( point ).sortable({
    handle: taskDrag,
    cancel: '',
    stop: function( event, ui ){
      var myIds = $(this).find('.one-task').map(function() {
        return this.className.split("-")[3];
      }).get();
      var projectId = $(this).attr('class').split("-")[2];
      $.ajax({
        url: '/drag-tasks/',
        type: 'POST',
        data: { 'ids': myIds,
                'project_id': projectId,
                authenticity_token: $('[name="csrf-token"]')[0].content
              },
        success:function(result){
          console.log("SUCCESS");
        },
        error:function(result){
          console.log("ERROR");
        }
      });   
    }
  });
}

  
  
  //JSON.stringify(myIds)


  //beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
  
  //$( point ).disableSelection();
