pragma solidity >=0.7.0 <0.9.0;


contract Todo  {

uint public taskCount =0;

constructor() public {
createTask("this is the first task from constructor");
}
// Model Task
struct  Task {
    uint id ;
    string taskContent;
    bool  isCompleted;
}

event taskCreated (
    uint id ,
    string taskContent,
    bool  isCompleted
);

event TaskCompleted (
     uint id ,
     bool  isCompleted
);


mapping(uint => Task) public tasks;
//list of tasks 
//create task method
function createTask(string memory taskContent)public {
    taskCount ++ ;
    tasks[taskCount] = Task(taskCount,taskContent,false);
    emit taskCreated(taskCount,taskContent,false);

}
//complete task method

function ToggleTask(uint id) public {
    Task memory _task = tasks[id];
    _task.isCompleted =!_task.isCompleted;
    tasks[id] = _task;

    emit TaskCompleted(id,_task.isCompleted);
}
}