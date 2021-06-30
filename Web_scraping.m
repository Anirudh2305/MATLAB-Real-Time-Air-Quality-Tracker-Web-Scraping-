%-------------------------------------------------------%
% Submitted By:-
% Utkarsh Ramachandra 2K19/EP/099 V.Anirudh 2K19/EP/100
%-------------------------------------------------------%


% This is the code for web scraping using the Text Analytics Toolbox.

options = weboptions('Timeout', 60); % sets the timeout to 60 seconds
url="https://www.aqi.in/dashboard/india/delhi/new-delhi";
code=webread(url,options); % returns the HTML code of the website
tree=htmlTree(code); % parses the HTML code and returns the resulting tree structure.
selector = "td"; %CSS Selector
subtrees = findElement(tree,selector);%returns the elements in TREE matching the CSS selector.
str = extractHTMLText(subtrees);%parses the HTML code and extracts the text from it.

mod_str=str(1:371); %stores the required information

% The following code stores the name of cities, status,AQI levels,PM 2.5
% and PM 10 concentrations in respective character arrays.
names_arr =[];
for i=1:7:371
    names_arr = [names_arr;mod_str(i)];
end

STATUS =[];
for i=2:7:371
    STATUS=[STATUS;mod_str(i)];
end

AQI =[];
for i=3:7:371
    AQI =[AQI;mod_str(i)];
end



PMTPF_2 =[];
for i=4:7:371
    PMTPF_2 =[PMTPF_2;mod_str(i)];
end


PMTEN_2=[];
for i=5:7:371
    PMTEN_2 =[PMTEN_2;mod_str(i)];
end


% convert the strings to numeric values

AQI_FINAL = [];
for i=1:length(AQI)
    AQI_FINAL = [AQI_FINAL;str2double(AQI(i))];
    
end


PMTPF_FINAL =[];
for i = 1:length(PMTPF_2)
    PMTPF_FINAL = [PMTPF_FINAL;str2double(PMTPF_2(i))];
end


PMTEN_FINAL =[];
for i = 1:length(PMTEN_2)
    PMTEN_FINAL =[PMTEN_FINAL;str2double(PMTEN_2(i))];
end








