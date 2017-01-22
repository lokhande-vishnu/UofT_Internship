function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 02-Apr-2014 15:57:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)
handles.type=1;
handles.str(1)={'C1'};
handles.str(2)={'C2'};
handles.str(3)={'C3'};
handles.str(4)={'C4'};
handles.str(5)={'CZ'};
handles.str(6)={'F3'};
handles.str(7)={'F4'};
handles.str(8)={'FZ'};
hold off
color=2;
width=2;
circle(4,15,2,color,width); hold on % draw electrode placement for C1
text(2.5,15,handles.str(1),'FontSize',20)
circle(16,15,2,color,width); text(14.5,15,handles.str(2),'FontSize',20)% draw electrode placement for C2
circle(-2,15,2,color,width); text(-3.5,15,handles.str(3),'FontSize',20) % draw electrode placement for C3
circle(22,15,2,color,width); text(20.5,15,handles.str(4),'FontSize',20) % draw electrode placement for C4
circle(10,15,2,color,width); text(8.5,15,handles.str(5),'FontSize',20) % draw electrode placement for CZ
circle(2,25,2,color,width); text(0.5,25,handles.str(6),'FontSize',20) % draw electrode placement for F3
circle(18,25,2,color,width); text(16.5,25,handles.str(7),'FontSize',20) % draw electrode placement for F4
circle(10,25,2,color,width); text(8.5,25,handles.str(8),'FontSize',20) % draw electrode placement for FZ
circle(10,15,15,color,width) % draw head
axis([-10 30 0 30])
set(gca,'XTickLabel',{''})
set(gca,'YTickLabel',{''})
% hold off
% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in T1.
function T1_Callback(hObject, eventdata, handles)
% hObject    handle to T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 switch handles.type
     case 1
         load('AA03_group1.mat');   
    on_elec=evaluate(EEG_C1_first_al,1,1); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_first_al,1,1); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_first_al,1,1); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_first_al,1,1); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_first_al,1,1); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_first_al,1,1); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_first_al,1,1); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_first_al,1,1); circle(10,25,2,on_elec,2);   
    
     case 2
         load('AA03_group1.mat')
    on_elec=evaluate(EEG_C1_first_al,1,2); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_first_al,1,2); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_first_al,1,2); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_first_al,1,2); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_first_al,1,2); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_first_al,1,2); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_first_al,1,2); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_first_al,1,2); circle(10,25,2,on_elec,2); 
    
         case 3
         load('AA03_group2.mat')
    on_elec=evaluate(EEG_C1_first_al,1,3); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_first_al,1,3); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_first_al,1,3); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_first_al,1,3); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_first_al,1,3); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_first_al,1,3); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_first_al,1,3); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_first_al,1,3); circle(10,25,2,on_elec,2); 
    
         case 4
         load('AA03_group2.mat')
    on_elec=evaluate(EEG_C1_first_al,1,4); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_first_al,1,4); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_first_al,1,4); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_first_al,1,4); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_first_al,1,4); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_first_al,1,4); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_first_al,1,4); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_first_al,1,4); circle(10,25,2,on_elec,2); 
    
         case 5
         load('AA03_group3.mat')
    on_elec=evaluate(EEG_C1_first_al,1,5); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_first_al,1,5); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_first_al,1,5); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_first_al,1,5); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_first_al,1,5); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_first_al,1,5); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_first_al,1,5); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_first_al,1,5); circle(10,25,2,on_elec,2); 
    
         case 6
         load('AA03_group3.mat')
    on_elec=evaluate(EEG_C1_first_al,1,6); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_first_al,1,6); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_first_al,1,6); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_first_al,1,6); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_first_al,1,6); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_first_al,1,6); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_first_al,1,6); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_first_al,1,6); circle(10,25,2,on_elec,2); 
 end
 


% --- Executes on button press in T2.
function T2_Callback(hObject, eventdata, handles)
% hObject    handle to T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% hObject    handle to T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 switch handles.type
     case 1
         load('AA03_group1.mat');   
    on_elec=evaluate(EEG_C1_first_al,2,1); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_first_al,2,1); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_first_al,2,1); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_first_al,2,1); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_first_al,2,1); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_first_al,2,1); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_first_al,2,1); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_first_al,2,1); circle(10,25,2,on_elec,2); 
    
     case 2
         load('AA03_group1.mat');   
    on_elec=evaluate(EEG_C1_first_al,2,2); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_first_al,2,2); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_first_al,2,2); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_first_al,2,2); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_first_al,2,2); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_first_al,2,2); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_first_al,2,2); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_first_al,2,2); circle(10,25,2,on_elec,2);   
    
     case 3
         load('AA03_group2.mat');   
    on_elec=evaluate(EEG_C1_first_al,2,3); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_first_al,2,3); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_first_al,2,3); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_first_al,2,3); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_first_al,2,3); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_first_al,2,3); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_first_al,2,3); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_first_al,2,3); circle(10,25,2,on_elec,2); 
    
     case 4
         load('AA03_group2.mat');   
    on_elec=evaluate(EEG_C1_first_al,2,4); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_first_al,2,4); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_first_al,2,4); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_first_al,2,4); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_first_al,2,4); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_first_al,2,4); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_first_al,2,4); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_first_al,2,4); circle(10,25,2,on_elec,2); 
    
    case 5
         load('AA03_group3.mat');   
    on_elec=evaluate(EEG_C1_first_al,2,5); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_first_al,2,5); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_first_al,2,5); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_first_al,2,5); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_first_al,2,5); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_first_al,2,5); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_first_al,2,5); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_first_al,2,5); circle(10,25,2,on_elec,2); 
    
     case 6
         load('AA03_group3.mat');   
    on_elec=evaluate(EEG_C1_first_al,2,6); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_first_al,2,6); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_first_al,2,6); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_first_al,2,6); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_first_al,2,6); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_first_al,2,6); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_first_al,2,6); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_first_al,2,6); circle(10,25,2,on_elec,2); 
 end
    
% --- Executes on button press in T3.
function T3_Callback(hObject, eventdata, handles)
% hObject    handle to T3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% hObject    handle to T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 switch handles.type
     case 1
         load('AA03_group1.mat');   
    on_elec=evaluate(EEG_C1_first_al,3,1); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_first_al,3,1); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_first_al,3,1); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_first_al,3,1); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_first_al,3,1); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_first_al,3,1); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_first_al,3,1); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_first_al,3,1); circle(10,25,2,on_elec,2); 
    
     case 2
         load('AA03_group1.mat');   
    on_elec=evaluate(EEG_C1_first_al,3,2); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_first_al,3,2); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_first_al,3,2); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_first_al,3,2); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_first_al,3,2); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_first_al,3,2); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_first_al,3,2); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_first_al,3,2); circle(10,25,2,on_elec,2);   
    
     case 3
         load('AA03_group2.mat');   
    on_elec=evaluate(EEG_C1_first_al,3,3); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_first_al,3,3); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_first_al,3,3); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_first_al,3,3); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_first_al,3,3); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_first_al,3,3); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_first_al,3,3); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_first_al,3,3); circle(10,25,2,on_elec,2); 
    
     case 4
         load('AA03_group2.mat');   
    on_elec=evaluate(EEG_C1_first_al,3,4); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_first_al,3,4); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_first_al,3,4); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_first_al,3,4); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_first_al,3,4); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_first_al,3,4); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_first_al,3,4); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_first_al,3,4); circle(10,25,2,on_elec,2); 
    
    case 5
         load('AA03_group3.mat');   
    on_elec=evaluate(EEG_C1_first_al,3,5); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_first_al,3,5); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_first_al,3,5); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_first_al,3,5); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_first_al,3,5); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_first_al,3,5); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_first_al,3,5); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_first_al,3,5); circle(10,25,2,on_elec,2); 
    
     case 6
         load('AA03_group3.mat');   
    on_elec=evaluate(EEG_C1_first_al,3,6); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_first_al,3,6); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_first_al,3,6); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_first_al,3,6); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_first_al,3,6); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_first_al,3,6); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_first_al,3,6); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_first_al,3,6); circle(10,25,2,on_elec,2); 
 end
% --- Executes on button press in T4.
function T4_Callback(hObject, eventdata, handles)
% hObject    handle to T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
circle(16,15,2,2,2)
circle(-2,15,2,2,2); 
circle(22,15,2,2,2);
circle(10,15,2,2,2); 
circle(2,25,2,2,2); 
circle(18,25,2,2,2);
circle(10,25,2,2,2);
switch handles.type
     case 1
         load('AA03_group1.mat');   
    on_elec=evaluate(EEG_C1_first_al,4,1); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_first_al,4,1); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_first_al,4,1); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_first_al,4,1); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_first_al,4,1); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_first_al,4,1); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_first_al,4,1); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_first_al,4,1); circle(10,25,2,on_elec,2); 
    
     case 2
         load('AA03_group1.mat');   
    on_elec=evaluate(EEG_C1_second_al,4,2); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_second_al,4,2); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_second_al,4,2); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_second_al,4,2); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_second_al,4,2); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_second_al,4,2); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_second_al,4,2); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_second_al,4,2); circle(10,25,2,on_elec,2);   
    
     case 3
         load('AA03_group2.mat');   
    on_elec=evaluate(EEG_C1_first_al,4,3); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_first_al,4,3); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_first_al,4,3); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_first_al,4,3); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_first_al,4,3); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_first_al,4,3); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_first_al,4,3); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_first_al,4,3); circle(10,25,2,on_elec,2); 
    
     case 4
         load('AA03_group2.mat');   
    on_elec=evaluate(EEG_C1_second_al,4,4); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_second_al,4,4); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_second_al,4,4); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_second_al,4,4); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_second_al,4,4); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_second_al,4,4); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_second_al,4,4); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_second_al,4,4); circle(10,25,2,on_elec,2); 
    
    case 5
         load('AA03_group3.mat');   
    on_elec=evaluate(EEG_C1_first_al,4,5); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_first_al,4,5); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_first_al,4,5); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_first_al,4,5); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_first_al,4,5); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_first_al,4,5); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_first_al,4,5); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_first_al,4,5); circle(10,25,2,on_elec,2); 
    
     case 6
         load('AA03_group3.mat');   
    on_elec=evaluate(EEG_C1_second_al,4,6); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_second_al,4,6); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_second_al,4,6); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_second_al,4,6); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_second_al,4,6); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_second_al,4,6); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_second_al,4,6); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_second_al,4,6); circle(10,25,2,on_elec,2); 
 end      
% --- Executes on button press in T5.
function T5_Callback(hObject, eventdata, handles)
% hObject    handle to T5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
         load('AA03_group1.mat');   
    on_elec=evaluate(EEG_C1_first_al,5,1); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_first_al,5,1); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_first_al,5,1); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_first_al,5,1); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_first_al,5,1); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_first_al,5,1); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_first_al,5,1); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_first_al,5,1); circle(10,25,2,on_elec,2); 
% 
% --- Executes on button press in T6.
function T6_Callback(hObject, eventdata, handles)
% hObject    handle to T6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
         load('AA03_group1.mat');   
    on_elec=evaluate(EEG_C1_first_al,6,1); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_first_al,6,1); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_first_al,6,1); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_first_al,6,1); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_first_al,6,1); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_first_al,6,1); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_first_al,6,1); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_first_al,6,1); circle(10,25,2,on_elec,2); 

% --- Executes on button press in T7.
function T7_Callback(hObject, eventdata, handles)
% hObject    handle to T7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
         load('AA03_group1.mat');   
    on_elec=evaluate(EEG_C1_first_al,7,1); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_first_al,7,1); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_first_al,7,1); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_first_al,7,1); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_first_al,7,1); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_first_al,7,1); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_first_al,7,1); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_first_al,7,1); circle(10,25,2,on_elec,2); 

% --- Executes on button press in T8.
function T8_Callback(hObject, eventdata, handles)
% hObject    handle to T8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
         load('AA03_group1.mat');   
      on_elec=evaluate(EEG_C1_first_al,8,1); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_first_al,8,1); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_first_al,8,1); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_first_al,8,1); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_first_al,8,1); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_first_al,8,1); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_first_al,8,1); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_first_al,8,1); circle(10,25,2,on_elec,2); 

% --- Executes on button press in T9.
function T9_Callback(hObject, eventdata, handles)
% hObject    handle to T9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
         load('AA03_group1.mat');   
    on_elec=evaluate(EEG_C1_first_al,9,1); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_first_al,9,1); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_first_al,9,1); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_first_al,9,1); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_first_al,9,1); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_first_al,9,1); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_first_al,9,1); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_first_al,9,1); circle(10,25,2,on_elec,2); 

% --- Executes on button press in T10.
function T10_Callback(hObject, eventdata, handles)
% hObject    handle to T10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
         load('AA03_group1.mat');   
    on_elec=evaluate(EEG_C1_first_al,10,1); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_first_al,10,1); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_first_al,10,1); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_first_al,10,1); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_first_al,10,1); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_first_al,10,1); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_first_al,10,1); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_first_al,10,1); circle(10,25,2,on_elec,2); 
 
% --- Executes on button press in T11.
function T11_Callback(hObject, eventdata, handles)
% hObject    handle to T11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
         load('AA03_group1.mat');   
    on_elec=evaluate(EEG_C1_first_al,11,1); circle(4,15,2,on_elec,2); 
    on_elec=evaluate(EEG_C2_first_al,11,1); circle(16,15,2,on_elec,2);
    on_elec=evaluate(EEG_C3_first_al,11,1); circle(-2,15,2,on_elec,2);
    on_elec=evaluate(EEG_C4_first_al,11,1); circle(22,15,2,on_elec,2);
    on_elec=evaluate(EEG_CZ_first_al,11,1); circle(10,15,2,on_elec,2);
    on_elec=evaluate(EEG_F3_first_al,11,1); circle(2,25,2,on_elec,2);
    on_elec=evaluate(EEG_F4_first_al,11,1); circle(18,25,2,on_elec,2);
    on_elec=evaluate(EEG_FZ_first_al,11,1); circle(10,25,2,on_elec,2); 


% --- Executes on button press in T12.
function T12_Callback(hObject, eventdata, handles)
% hObject    handle to T12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in T13.
function T13_Callback(hObject, eventdata, handles)
% hObject    handle to T13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in T14.
function T14_Callback(hObject, eventdata, handles)
% hObject    handle to T14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in T15.
function T15_Callback(hObject, eventdata, handles)
% hObject    handle to T15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%--- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
val=get(hObject,'Value');
grasp=get(hObject,'String');
switch grasp{val}
    case 'Pinch'
          handles.type=1;
    case 'non-Functional 1'
         handles.type=2;
    case 'Lateral'
         handles.type=3;
    case 'Extenion'
         handles.type=4;
    case 'non-Fuctional 2'
         handles.type=5;
    case 'Palmar'
         handles.type=6;                   
end   
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


