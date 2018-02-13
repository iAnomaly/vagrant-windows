package 'SSMS' do
  source 'https://download.microsoft.com/download/0/A/E/0AE3B5C9-0D22-4EF3-B48A-73181A7F8EF7/SSMS-Setup-ENU.exe'
  installer_type :custom
  options '/install /quiet /norestart'
  timeout 1800
end
