% octave p.m [file name]

% forge install signal,control
pkg load signal

arg_list = argv();

% arguments: [infile outfile name]
for ind = 1:3:length(arg_list)
  fname = arg_list{ind};

  arr=csvread(fname, 1, 0);
  time=size(arr,1);
  numOfCells = size(arr, 2) - 2; % -2 --> time col and lacI col

  steps = arr(:, 1); %time steps od 1 do time (nastimas v Bsim intelliJ)
  celice = arr(1:time, 3:end); %cell data

  try
    res=[];
    for i = 1:numOfCells
      sig = celice(:,i);
      m = max(sig);
      [pks, idx]=findpeaks(sig);
      [mpks, mid]=findpeaks(m-sig);
      low=-(mpks-m);
      a=sortrows([pks idx; low mid], [2]);
      res2=[];
      for i=1:size(a,1)-1
        amp=abs(a(i,1)-a(i+1,1));

        id1=a(i,2);
        id2=a(i+1,2);
        len=2*(id2-id1);

        res2 = [res2; amp len ((id1+id2)/2)];
      end
      res = [res; res2];
    end
  catch
    disp("amplitude 0.0")
    disp("period inf")
    return
  end_try_catch

  res=sortrows(res, [3]);
  n = 100;
  b = [];
  for i=1:n:length(res)-n+1
    b = [b; mean(res(i:i+n-1, :))];
  end

  d=int32(length(res)*0.8);
  c=mean(res(d:length(res)-1, :));
  printf("amplitude %f\nperiod %f\n", c(1), c(2));

  [hax, h1, h2] = plotyy(b(:,3), b(:,1), b(:,3), b(:,2));

  hold on;
  title('Represilator - simulacija');
  xlabel('Trajanje [s]'); % x-axis label

  nm=arg_list{ind+2};
  ylabel(hax(1), sprintf('Amplituda nivoja %s v bakterijah', nm)); % y-axis label
  ylabel(hax(2), sprintf('Valovna dolzina %s v bakterijah', nm)); % right y-axis label

  outfile=arg_list{ind+1};
  print(outfile, "-color", "-depsc")
  hold off;
end
