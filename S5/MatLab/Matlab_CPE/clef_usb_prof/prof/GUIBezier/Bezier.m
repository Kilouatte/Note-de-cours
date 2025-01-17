function varargout = Bezier(varargin)
% BEZIER M-file for Bezier.fig
%      BEZIER, by itself, creates a new BEZIER or raises the existing
%      singleton*.
%
%      H = BEZIER returns the handle to a new BEZIER or the handle to
%      the existing singleton*.
%
%      BEZIER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BEZIER.M with the given input arguments.
%
%      BEZIER('Property','Value',...) creates a new BEZIER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Bezier_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Bezier_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Bezier

% Last Modified by GUIDE v2.5 17-Dec-2010 15:16:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Bezier_OpeningFcn, ...
                   'gui_OutputFcn',  @Bezier_OutputFcn, ...
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


% --- Executes just before Bezier is made visible.
function Bezier_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Bezier (see VARARGIN)
P1=[-5 1];
P2=[0 0];
P3=[5 1];
[x y]=xy3(P1,P2,P3);
hold on
plot(x ,y,'r-o')
window3(P1, P2, P3)
handles.Points = [P1;P2;P3];
handles.t = 0;

% Choose default command line output for Bezier
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Bezier wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Bezier_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% ancienne valeur
t=handles.t;
P1=handles.Points(1,:);
P2=handles.Points(2,:);
P3=handles.Points(3,:);
M1 =PlotBezier2(P1,P2,t);
M2 =PlotBezier2(P2,P3,t);
%effacer segmen
if t~= 0
    plot([M1(1) M2(1)],[M1(2) M2(2)],'w-')
end

% nouvelle valeur
t = get(hObject,'Value');
set(handles.Affichage,'String',t);
handles.t=t;
handles.t
M1 =PlotBezier2(P1,P2,t);
M2 =PlotBezier2(P2,P3,t);
M3 =PlotBezier2(M1,M2,t);

% tracer
plot(M1(1) ,M1(2),'b.')
plot(M2(1) ,M2(2),'b.')
plot([M1(1) M2(1)],[M1(2) M2(2)])
plot(M3(1) ,M3(2),'mo')

% Update handles structure
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
%findjobj;
%jScrollBar = findjobj(hObject);
%jScrollBar.AdjustmentValueChangedCallback = @slider1_Callback;



function Affichage_Callback(hObject, eventdata, handles)
% hObject    handle to Affichage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Affichage as text
%        str2double(get(hObject,'String')) returns contents of Affichage as a double


% --- Executes during object creation, after setting all properties.
function Affichage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Affichage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


