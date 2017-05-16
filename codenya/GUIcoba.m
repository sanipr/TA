function varargout = GUIcoba(varargin)
% GUICOBA MATLAB code for GUIcoba.fig
%      GUICOBA, by itself, creates a new GUICOBA or raises the existing
%      singleton*.
%
%      H = GUICOBA returns the handle to a new GUICOBA or the handle to
%      the existing singleton*.
%
%      GUICOBA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUICOBA.M with the given input arguments.
%
%      GUICOBA('Property','Value',...) creates a new GUICOBA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUIcoba_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUIcoba_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUIcoba

% Last Modified by GUIDE v2.5 09-May-2017 13:00:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUIcoba_OpeningFcn, ...
                   'gui_OutputFcn',  @GUIcoba_OutputFcn, ...
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


% --- Executes just before GUIcoba is made visible.
function GUIcoba_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUIcoba (see VARARGIN)

%setting jumlah output menjadi 10
handles.jmlh=10;
handles.flag=0;
% guidata(hObject,handles);

% Choose default command line output for GUIcoba
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUIcoba wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUIcoba_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in browse_button.
function browse_button_Callback(hObject, eventdata, handles)
[FileName,PathName] = uigetfile('*.jpg','Select image file');
handles.filepath=PathName;
handles.filename=FileName;
path=strcat(handles.filepath,handles.filename);
set(handles.edit1,'String',path);
% guidata(hObject,handles); % instruksi simpan object
% button(handles.cari_button);
im = imread([PathName,FileName]);
handles.im=im; % menyimpan nilai variabel
guidata(hObject,handles); % instruksi simpan object
axes(handles.query_image); % memasukkan nilai variabel pada axis
imshow(im); % menampilkan image hasil browse
if handles.flag==1
axes(handles.uipanel1)
for i=1:handles.hps
    subplot(4,5,i), cla(handles.uipanel1);
end
end


% --- Executes on button press in cari_button.
function cari_button_Callback(hObject, eventdata, handles)
% hObject    handle to cari_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hasil = mainbuatgui(handles.filepath, handles.filename, handles.jmlh);
srcFiles= dir('/Users/sani/Kuliah/Sem8/TA/codenya/link_download/dataset3/*.jpg');
for i=1:handles.jmlh
%     if i<=handles.jmlh
filename1 = strcat('/Users/sani/Kuliah/Sem8/TA/codenya/link_download/dataset3/',srcFiles(hasil.mirip(i,2)).name);
I=imread(filename1);
handles.I=I;
guidata(hObject,handles); % instruksi simpan object
axes(handles.uipanel1); % memasukkan nilai variabel pada axis
subplot(4,5,i), imshow(I);
%     end
%     subplot(4,5,i), cla(handles.uipanel1);
end
x='%';
p=strcat(num2str(hasil.PR.precision),x);
r=strcat(num2str(hasil.PR.recall),x);
p=strcat('precision : ',p);
r=strcat('recall : ',r);
set(handles.precision,'String',p);
set(handles.recall,'String',r);
handles.flag=1;
handles.hps=handles.jmlh;
guidata(hObject,handles);







% --- Executes during object creation, after setting all properties.
function query_image_CreateFcn(hObject, eventdata, handles)
% hObject    handle to query_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate query_image


% --- Executes during object creation, after setting all properties.
function recall_CreateFcn(hObject, eventdata, handles)
% hObject    handle to recall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes during object creation, after setting all properties.
function uipanel1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in pilih_jumlah.
function pilih_jumlah_Callback(hObject, eventdata, handles)
% hObject    handle to pilih_jumlah (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pilih_jumlah contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pilih_jumlah
pilih=get(hObject, 'value');
switch pilih
    case 1
        jmlh=10;
        handles.jmlh=jmlh;
        guidata(hObject,handles);
    case 2
        jmlh=12;
        handles.jmlh=jmlh;
        guidata(hObject,handles);
    case 3
        jmlh=20;
        handles.jmlh=jmlh;
        guidata(hObject,handles);
end


% --- Executes during object creation, after setting all properties.
function pilih_jumlah_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pilih_jumlah (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
