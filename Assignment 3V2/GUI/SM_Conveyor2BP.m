%Function sends the appropriate functions to robot studio to move a block
%from one BP to another
function SM_Conveyor2BP(X1, Y1, X2, Y2)
    global queue;
    fast = 'v500';
    regular = 'v100';
    slow = 'v50';
    table_height = 147;
    conveyor_height = 22;
    block_height = 8;
    move_height = table_height + block_height * 2.5;
    grip_height = table_height + block_height;
    conveyor_grip_height = conveyor_height + block_height;
    
    
    %first avoid collision with table
    %WIP
    %WIP
    
    %move to conveyor position
    commandStr = sprintf('moveerb %.3f %.3f %.3f %.3f %.3f %.3f %s', X1,Y1,move_height,0,180,0,fast);
    queue.add(commandStr);
    
    %turn on vacuum
    commandStr = sprintf('vacuumPumpOn');
    queue.add(commandStr);
    
    %move down to conveyor
    commandStr = sprintf('moveerb %.3f %.3f %.3f %.3f %.3f %.3f %s', X1,Y1,conveyor_grip_height,0,180,0,regular);
    queue.add(commandStr);
    
    %turn on solenoid
    commandStr = sprintf('vacuumSolenoidOn');
    queue.add(commandStr);
    
    %lift block
    commandStr = sprintf('moveerb %.3f %.3f %.3f %.3f %.3f %.3f %s', X1,Y1,move_height,0,180,0,fast);
    queue.add(commandStr);
    
    %move to BP
    commandStr = sprintf('moveerb %.3f %.3f %.3f %.3f %.3f %.3f %s', X2,Y2,move_height,0,180,0,fast);
    queue.add(commandStr);
    
    %move down to block
    commandStr = sprintf('moveerb %.3f %.3f %.3f %.3f %.3f %.3f %s', X2,Y2,grip_height,0,180,0,regular);
    queue.add(commandStr);
    
    %turn off solenoid
    commandStr = sprintf('vacuumSolenoidOff');
    queue.add(commandStr);
    
    %move up to move height
    commandStr = sprintf('moveerb %.3f %.3f %.3f %.3f %.3f %.3f %s', X2,Y2,move_height,0,180,0,regular);
    queue.add(commandStr);
    
    %turn off pump
    commandStr = sprintf('vacuumPumpOff');
    queue.add(commandStr);
    

end