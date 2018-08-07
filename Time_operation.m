
function varargout = Time_operation(varargin)
global x y; 
% TIME_OPERATION MATLAB code for Time_operation.fig
%      TIME_OPERATION, by itself, creates a new TIME_OPERATION or raises the existing
%      singleton*.
%
%      H = TIME_OPERATION returns the handle to a new TIME_OPERATION or the handle to
%      the existing singleton*.
%
%      TIME_OPERATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TIME_OPERATION.M with the given input arguments.
%
%      TIME_OPERATION('Property','Value',...) creates a new TIME_OPERATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Time_operation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Time_operation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Time_operation

% Last Modified by GUIDE v2.5 02-Aug-2018 00:35:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Time_operation_OpeningFcn, ...
                   'gui_OutputFcn',  @Time_operation_OutputFcn, ...
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


% --- Executes just before Time_operation is made visible.
function Time_operation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Time_operation (see VARARGIN)

% Choose default command line output for Time_operation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Time_operation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Time_operation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function edit_time_op_Callback(hObject, eventdata, handles)
% hObject    handle to edit_time_op (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_time_op as text
%        str2double(get(hObject,'String')) returns contents of edit_time_op as a double

% --- Executes during object creation, after setting all properties.

function edit_time_op_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_time_op (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in fix_.
function fix__Callback(hObject, eventdata, handles)
% hObject    handle to fix_ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc; 
% cla; 
expr = sym(get(handles.edit_time_op, 'String'));
cf = coeffs(expr);

global x y
x_ = x
y_ = y 
if(length(cf)==1)
    kx= cf(1);
    y_ = y*kx % amplitude scaling
else
    kx = cf(2)
    x_ = double(x_-cf(1))  % time shifting
    x_ = double(x_/kx) % t - scaling
end
axes(handles.g2); 
plot(x_,y_);
% set(gca, 'ytick', -10:10);
% set(gca, 'xtick', -10:10); 
grid on

% --- Executes on button press in sk_signals.
function sk_signals_Callback(hObject, eventdata, handles)
% hObject    handle to sk_signals (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
cla; 
axes(handles.g1); 
axis([-10 10 -10 10]);
global x y; 
[x, y] = getpts()
plot(x, y, 'k-');
% set(gca, 'ytick', -10:10);
% set(gca, 'xtick', -10:10); 
grid on
hold on
xlabel('t');
ylabel('x(t)');
title('initial function x(t)');
