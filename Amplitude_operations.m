function varargout = Amplitude_operations(varargin)
% AMPLITUDE_OPERATIONS MATLAB code for Amplitude_operations.fig
%      AMPLITUDE_OPERATIONS, by itself, creates a new AMPLITUDE_OPERATIONS or raises the existing
%      singleton*.
%
%      H = AMPLITUDE_OPERATIONS returns the handle to a new AMPLITUDE_OPERATIONS or the handle to
%      the existing singleton*.
%
%      AMPLITUDE_OPERATIONS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AMPLITUDE_OPERATIONS.M with the given input arguments.
%
%      AMPLITUDE_OPERATIONS('Property','Value',...) creates a new AMPLITUDE_OPERATIONS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Amplitude_operations_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Amplitude_operations_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Amplitude_operations

% Last Modified by GUIDE v2.5 06-Aug-2018 20:28:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Amplitude_operations_OpeningFcn, ...
                   'gui_OutputFcn',  @Amplitude_operations_OutputFcn, ...
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


% --- Executes just before Amplitude_operations is made visible.
function Amplitude_operations_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Amplitude_operations (see VARARGIN)

% Choose default command line output for Amplitude_operations
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Amplitude_operations wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Amplitude_operations_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in add_button.
function add_button_Callback(hObject, eventdata, handles)
% hObject    handle to add_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc; 
% cla; 
global x1 x2 t1 t2
t_com = min(min(t2),min(t1)): max(max(t1), max(t2)); 
x2_ = zeros(size(t_com));
x1_ = zeros(size(t_com));

for i = 1:length(t1)
    x1_(find(t_com==t1(i))) =x1(i);  
end
for i = 1:length(t2)
    x2_(find(t_com==t2(i))) =x2(i);  
end
x_ = x1_+x2_; 
axes(handles.axes3)
axis([-10 10 -10 10]);
stem(t_com, x_); 
grid on
xlabel('t');
ylabel('f(t)');
title('function added f(t)');

% --- Executes on button press in subtract_button.
function subtract_button_Callback(hObject, eventdata, handles)
% hObject    handle to subtract_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc; 
% % cla;
global x1 x2 t1 t2
t_com = min(min(t2),min(t1)): max(max(t1), max(t2)); 
x2_ = zeros(size(t_com));
x1_ = zeros(size(t_com));

for i = 1:length(t1)
    x1_(find(t_com==t1(i))) =x1(i);  
end
for i = 1:length(t2)
    x2_(find(t_com==t2(i))) =x2(i);  
end
x_ = x1_-x2_; 
axes(handles.axes3)
axis([-10 10 -10 10]);

stem(t_com, x_);
% set(gca, 'ytick', -10:10);
% set(gca, 'xtick', -10:10); 
grid on
xlabel('t');
ylabel('f(t)');
title('function subtracted f(t)');

% --- Executes on button press in mult_button.
function mult_button_Callback(hObject, eventdata, handles)
% hObject    handle to mult_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc; 
% cla; 
global x1 x2 t1 t2
t_com = min(min(t2),min(t1)):max(max(t1), max(t2)); 
x2_ = zeros(size(t_com));
x1_ = zeros(size(t_com));

for i = 1:length(t1)
    x1_(find(t_com==t1(i))) =x1(i);  
end
for i = 1:length(t2)
    x2_(find(t_com==t2(i))) =x2(i);  
end
x_ = x1_.*x2_; 
axes(handles.axes3)
axis([-10 10 -10 10]);
stem(t_com, x_); 
% set(gca, 'ytick', -10:10);
% set(gca, 'xtick', -10:10); 
grid on
xlabel('t');
ylabel('f(t)');
title('function subtracted f(t)');

% --- Executes on button press in s2_button.
function s2_button_Callback(hObject, eventdata, handles)
% hObject    handle to s2_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes2); 
axes(handles.axes2); 

global t2 x2; 
axis([-10 10 -10 10]);
[t2, x2] = getpts()
t2 = round(t2);
% axis([-10 10 -10 10]); 
stem(t2, x2, 'r-');
set(gca, 'ytick', -15:15);
set(gca, 'xtick', -15:15); 
grid on
xlabel('t');
ylabel('x2(t)');
title('function x2(t)');
hold on

% --- Executes on button press in s1_button.
function s1_button_Callback(hObject, eventdata, handles)
% hObject    handle to s1_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
cla; 
axes(handles.axes1); 

global t1 x1; 
axis([-10 10 -10 10]); 
[t1, x1] = getpts();
t1 = round(t1);
stem(t1, x1, 'k-');
% set(gca, 'ytick', -10:10);
% set(gca, 'xtick', -10:10); 
grid on
xlabel('t');
ylabel('x1(t)');
title('function x1(t)');
hold on
