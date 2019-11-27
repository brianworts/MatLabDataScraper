
clear
clc
x03=1;
x11=1;
x128=1;
x129=1;
x23=1;
x94=1;
urlPre = 'https://www.ncdc.noaa.gov/orders/qclcd/QCLCD';
for i= 1:12 %For loop to download all 2016 data   
    if (i<10)       %This if else statement can be substitued using %02d and sprintf()
        i = num2str(i); %Converts i from num to string
        url = strcat(urlPre,'20160',i,'.zip'); %Combines four strings into one
        fileName = strcat('20160',i,'daily.txt');
    elseif ((i>=10) & (i<=12))
        i = num2str(i);
        url = strcat(urlPre, '2016', i,'.zip'); 
        fileName = strcat('2016',i,'daily.txt'); 
    else
        disp('Error while creating file names')
    end %End if/elseif statement
        
        
    if (exist(fileName) == 2) %exist returns 2 if finds .txt with name
        disp(strcat('file',fileName, ' already exsists. Continuing'));
    else
        zipName=strcat('Data','2016',i,'.zip'); %Does not display 0 in front of single digit numbers
        outFileName= websave(zipName,url); %Downloads file from url as .zip and gives it zipName
        unzippedFile = unzip(zipName); %Unzips file
    end %End download if/else
         fileId = fopen(fileName);
    running=true;
    while (running)
    
        rowData=fgets(fileId); %Returns one row each iteration
        if (rowData==-1)
            running=false;
        else
        
            ALLdata = textscan(rowData,'%s', 'delimiter', ',');  %Puts comma seperated data into cell data
    
            WbanId = cell2mat(ALLdata{1}(1)); %Sets wbanId = first column of row
            %type = class(WbanId) WbanId is char
            NumWbanId = str2num(WbanId);  %Converts WbanId from char array to number
    
            if (NumWbanId == 94728) | (NumWbanId == 12960) | (NumWbanId == 03017) | ...
                (NumWbanId == 12836) | (NumWbanId == 11641) | (NumWbanId == 23234)
            
                switch NumWbanId
                        
                    case 94728
                        avgData94 = cell2mat(ALLdata{1}(7)); %Sets value in 7th column equal to avgData
                        NumAverageData94 = str2num(avgData94); %Converts avgData to number
                        if (isempty(NumAverageData94)) %Needed since if the else statement reaches empty cell, causes error
                            continue
                        else 
                            avgMatrix94(x94) = NumAverageData94;  %Stores number at index i
                            x94= x94 + 1;;
                        end
                        
                    case 12960
                        avgData129 = cell2mat(ALLdata{1}(7)); %Sets value in 7th column equal to avgData
                        NumAverageData129 = str2num(avgData129); %Converts avgData to number
                        if (isempty(NumAverageData129)) %Needed since if the else statement reaches empty cell, causes error
                            continue
                        else 
                            avgMatrix129(x129) = NumAverageData129;  %Stores number at index i
                            x129= x129 + 1;;
                        end
                        
                    case 03017
                        avgData03 = cell2mat(ALLdata{1}(7)); %Sets value in 7th column equal to avgData
                        NumAverageData03 = str2num(avgData03); %Converts avgData to number
                        if (isempty(NumAverageData03)) %Needed since if the else statement reaches empty cell, causes error
                            continue
                        else 
                            avgMatrix03(x03) = NumAverageData03;  %Stores number at index i
                            x03= x03 + 1;;
                        end
                        
                    case 12836
                        avgData128 = cell2mat(ALLdata{1}(7)); %Sets value in 7th column equal to avgData
                        NumAverageData128 = str2num(avgData128); %Converts avgData to number
                        if (isempty(NumAverageData128)) %Needed since if the else statement reaches empty cell, causes error
                            continue
                        else 
                            avgMatrix128(x128) = NumAverageData128;  %Stores number at index i
                            x128= x128 + 1;;
                        end
                        
                    case 11641
                         avgData11 = cell2mat(ALLdata{1}(7)); %Sets value in 7th column equal to avgData
                        NumAverageData11 = str2num(avgData11); %Converts avgData to number
                        if (isempty(NumAverageData11)) %Needed since if the else statement reaches empty cell, causes error
                            continue
                        else 
                            avgMatrix11(x11) = NumAverageData11;  %Stores number at index i
                            x11= x11 + 1;;
                        end
                        
                    case 23234
                        avgData23 = cell2mat(ALLdata{1}(7)); %Sets value in 7th column equal to avgData
                        NumAverageData23 = str2num(avgData23); %Converts avgData to number
                        if (isempty(NumAverageData23)) %Needed since if the else statement reaches empty cell, causes error
                            continue
                        else 
                            avgMatrix23(x23) = NumAverageData23;  %Stores number at index i
                            x23= x23 + 1;;
                        end
                     
            
                    otherwise
                        disp('error in switch statement')
                     
                     end %End switch
                else   
                    continue
                end %end if
            
         end %end if
         
     end %end while
  end %end for loop    
    
for i= 1:12 %For loop to download all 2017 data using same frame as 216  
    if (i<10)                
        i = num2str(i); %Converts i from num to string
        url = strcat(urlPre,'20170',i,'.zip'); 
        fileName = strcat('20170',i,'daily.txt');  
    elseif ((i>=10) & (i<=12))
        i = num2str(i);
        url = strcat(urlPre, '2017', i,'.zip'); 
        fileName = strcat('2017',i,'daily.txt');
    else
        disp('Error while creating file names')
    end %End if/elseif statement
        

    if (exist(fileName) == 2) %exist returns 2 if finds .txt with name
        disp(strcat('file',fileName, ' already exsists. Continuing'));
    else
        zipName=strcat('Data','2017',i,'.zip');
        outFileName= websave(zipName,url); 
        unzippedFile = unzip(zipName);
    end %End download if/else
        fileId = fopen(fileName);
    running=true;
    while (running)
    
        rowData=fgets(fileId); %Returns one row each iteration
        if (rowData==-1)
            running=false;
        else
        
            ALLdata = textscan(rowData,'%s', 'delimiter', ',');  %Puts comma seperated data into cell data
    
            WbanId = cell2mat(ALLdata{1}(1)); %Sets wbanId = first column of row
            %type = class(WbanId) WbanId is char
            NumWbanId = str2num(WbanId);  %Converts WbanId from char array to number
    
            if (NumWbanId == 94728) | (NumWbanId == 12960) | (NumWbanId == 03017) | ...
                (NumWbanId == 12836) | (NumWbanId == 11641) | (NumWbanId == 23234)
            
                switch NumWbanId
                        
                    case 94728
                        avgData94 = cell2mat(ALLdata{1}(7)); %Sets value in 7th column equal to avgData
                        NumAverageData94 = str2num(avgData94); %Converts avgData to number
                        if (isempty(NumAverageData94)) %Needed since if the else statement reaches empty cell, causes error
                            continue
                        else 
                            avgMatrix94(x94) = NumAverageData94;  %Stores number at index i
                            x94= x94 + 1;     %X value should carry over from previous loop
                        end
                        
                    case 12960
                        avgData129 = cell2mat(ALLdata{1}(7)); %Sets value in 7th column equal to avgData
                        NumAverageData129 = str2num(avgData129); %Converts avgData to number
                        if (isempty(NumAverageData129)) %Needed since if the else statement reaches empty cell, causes error
                            continue
                        else 
                            avgMatrix129(x129) = NumAverageData129;  %Stores number at index i
                            x129= x129 + 1;;
                        end
                        
                    case 03017
                        avgData03 = cell2mat(ALLdata{1}(7)); %Sets value in 7th column equal to avgData
                        NumAverageData03 = str2num(avgData03); %Converts avgData to number
                        if (isempty(NumAverageData03)) %Needed since if the else statement reaches empty cell, causes error
                            continue
                        else 
                            avgMatrix03(x03) = NumAverageData03;  %Stores number at index i
                            x03= x03 + 1;;
                        end
                        
                    case 12836
                        avgData128 = cell2mat(ALLdata{1}(7)); %Sets value in 7th column equal to avgData
                        NumAverageData128 = str2num(avgData128); %Converts avgData to number
                        if (isempty(NumAverageData128)) %Needed since if the else statement reaches empty cell, causes error
                            continue
                        else 
                            avgMatrix128(x128) = NumAverageData128;  %Stores number at index i
                            x128= x128 + 1;;
                        end
                        
                    case 11641
                         avgData11 = cell2mat(ALLdata{1}(7)); %Sets value in 7th column equal to avgData
                        NumAverageData11 = str2num(avgData11); %Converts avgData to number
                        if (isempty(NumAverageData11)) %Needed since if the else statement reaches empty cell, causes error
                            continue
                        else 
                            avgMatrix11(x11) = NumAverageData11;  %Stores number at index i
                            x11= x11 + 1;;
                        end
                        
                    case 23234
                        avgData23 = cell2mat(ALLdata{1}(7)); %Sets value in 7th column equal to avgData
                        NumAverageData23 = str2num(avgData23); %Converts avgData to number
                        if (isempty(NumAverageData23)) %Needed since if the else statement reaches empty cell, causes error
                            continue
                        else 
                            avgMatrix23(x23) = NumAverageData23;  %Stores number at index i
                            x23= x23 + 1;;
                        end
                     
            
                    otherwise
                        disp('error in switch statement')
                     
                     end %End switch
                else   
                    continue
                end %end if
            
         end %end if
         
   end %end while

end %End for loop    
   

    %}
plot (1:length(avgMatrix03),avgMatrix03,1:length(avgMatrix11),avgMatrix11,1:length(avgMatrix128),avgMatrix128, ...
     1:length(avgMatrix129),avgMatrix129,1:length(avgMatrix23),avgMatrix23,1:length(avgMatrix94),avgMatrix94)
xlabel('data point')
ylabel('temperature')
legend('WBAN Station 03017','WBAN Station 11641','WBAN Station 12836','WBAN Station 12960','WBAN Station 23234','WBAN Station 94728')
   
