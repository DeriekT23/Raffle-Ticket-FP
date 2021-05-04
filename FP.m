%Deriek Thomas & John Vohs
function [] = FP()
global raffle;
raffle.money = 0.00;
raffle.tickets = 0;
raffle.fig = figure('numbertitle', 'off', 'name', 'Raffle Generator');
raffle.dollarGain = uicontrol('style', 'pushbutton', 'units', 'normalized', 'position',[.30 .8 .4 .1], 'string', '1 ticket for 5 dollars', 'callback',{@overall,5,1});
raffle.dollarGain = uicontrol('style', 'pushbutton', 'units', 'normalized', 'position',[.30 .7 .4 .1], 'string', '5 tickets for 20 dollars', 'callback',{@overall,20,5});
raffle.dollarGain = uicontrol('style', 'pushbutton', 'units', 'normalized', 'position',[.30 .6 .4 .1], 'string', '10 tickets for 35 dollars',  'callback',{@overall,35,10});
raffle.dollarGain = uicontrol('style', 'pushbutton', 'units', 'normalized', 'position',[.30 .5 .4 .1 ], 'string', '100 tickets for 200 dollars', 'callback',{@overall,200,100});
raffle.moneyDisplayMessage = uicontrol('style', 'text', 'units', 'normalized', 'position', [.35 .4 .09 .095], 'string', 'Money Earned:', 'horizontalalignment', 'center');
raffle.moneyDisplay = uicontrol('style', 'text', 'units', 'normalized', 'position',[.35 .35 .09 .05], 'string', num2str(raffle.money), 'horizontalalignment', 'center');
raffle.ticketDisplayMessage = uicontrol('style', 'text', 'units', 'normalized', 'position', [.55 .4 .09 .095], 'string', 'Total Tickets:', 'horizontalalignment', 'center');
raffle.ticketDisplay = uicontrol('style', 'text', 'units', 'normalized', 'position',[.55 .35 .09 .05], 'string', num2str(raffle.tickets), 'horizontalalignment', 'center');
raffle.raffleWinner = uicontrol('style', 'pushbutton','units', 'normalized', 'position',[0 .1 1 .1], 'string', 'Randomly Select Winner', 'callback',{@chickenDinner});
raffle.goal = uicontrol('style', 'text', 'units', 'normalized','position',[.35 .2 .09 .095],'string','Goal of:', 'horizontalalignment', 'center'); 
raffle.goal = uicontrol('style', 'edit', 'units', 'normalized', 'position',[.435 .225 .15 .095], 'horizontalalignment', 'center');
raffle.goal = uicontrol('style', 'popupmenu', 'units', 'normalized', 'position',[.6 .2 .15 .095],'horizontalalignment', 'center','string',{'Dollars','Tickets'});



function [] = overall(source, event, cash, ticket)
raffle.money = raffle.money + cash; %money being earned
raffle.tickets = raffle.tickets + ticket; %ticket being added
raffle.moneyDisplay.String = num2str(raffle.money); %money earned in total
raffle.ticketDisplay.String = num2str(raffle.tickets); %tickets in total

end

function [] = chickenDinner(source, event)
    if (raffle.tickets > 0)
        w = randi(raffle.tickets);
        str = num2str(w);
        winnerMsg = ['AND THE WINNER IS... ', str];
        msgbox(winnerMsg,'WINNER!', 'modal');
    else
        msgbox('Insufficent Amount of Tickets','modal')
    end
end   

end




