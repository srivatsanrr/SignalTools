function varargout = Conv1D(varargin)
% CONV1D MATLAB code for Conv1D.fig
%      CONV1D, by itself, creates a new CONV1D or raises the existing
%      singleton*.
%
%      H = CONV1D returns the handle to a new CONV1D or the handle to
%      the existing singleton*.
%
%      CONV1D('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONV1D.M with the given input arguments.
%
%      CONV1D('Property','Value',...) creates a new CONV1D or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Conv1D_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Conv1D_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Conv1D

% Last Modified by GUIDE v2.5 06-Aug-2018 20:37:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Conv1D_OpeningFcn, ...
                   'gui_OutputFcn',  @Conv1D_OutputFcn, ...
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


% --- Executes just before Conv1D is made visible.
function Conv1D_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Conv1D (see VARARGIN)

% Choose default command line output for Conv1D
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Conv1D wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Conv1D_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in conv.
function conv_Callback(hObject, eventdata, handles)
% hObject    handle to conv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x1 x2 
m = length(x1); 
n = length(x2); 
X1 = [transpose(x1) zeros(1,n)]; 
X2 = [transpose(x2) zeros(1,m)]; 

for i = 1:n+m-1  
    Y(i) = 0; 
    for j = 1:i
       Y(i) = Y(i) + X1(j)* X2(i-j+1) ;  
    end
end
axes(handles.axes3); 
grid on
stem(Y, 'r-'); 
% xticks([-15:1:15]);
% yticks([-5:2:5]); 
grid on
xlabel('t');
ylabel('Y(t)');

% --- Executes on button press in sig2.
function sig2_Callback(hObject, eventdata, handles)
% hObject    handle to sig2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% hObject    handle to s2_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes2); 
axes(handles.axes2); 
global t2 x2; 
axis([-10 10 -10 10]);
grid on
[t2, x2] = getpts()
t2 = round(t2);
% axis([-10 10 -10 10]); 
stem(t2, x2, 'r-')
xticks([-15:1:15]);
yticks([-5:2:5]); 
grid on
xlabel('t');
ylabel('x2(t)');
title('function x2(t)');
% hold on

% --- Executes on button press in sig1.
function sig1_Callback(hObject, eventdata, handles)
% hObject    handle to sig1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
cla
axes(handles.axes1); 
global t1 x1; 
axis([-10 10 -10 10]);
grid on
[t1, x1] = getpts()
t1 = round(t1);
stem(t1, x1, 'k-');
xticks([-15:1:15]);
yticks([-5:2:5]); 
grid on
xlabel('t');
ylabel('x1(t)');
title('function x1(t)');
% hold on
