# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create the roles (admin, buyer)
Role.create(name: :admin)
Role.create(name: :buyer)

user1 = User.create(email: 'admin@gmail.com', password: '12345678', password_confirmation: '12345678', username: 'admin', user_type: 'Admin')
user1.add_role(:admin)

user2 = User.create(email: 'tknlibunao@gmail.com', password: '12345678', password_confirmation: '12345678', username: 'tknlibunao', user_type: 'Buyer')
user2.add_role(:buyer)

# MARKETS - STOCK LIST - random buying/selling values - https://docs.google.com/spreadsheets/d/1EmrS-yyJfsQwuh0-ynYcXby5n52RiadiBQLyQFadJYI/edit?usp=sharing
stock1 = Market.create(stock_name:'APPLE INC.', symbol:'AAPL',volume:'5259',trades:'0',buying_price:'114.762489651751',selling_price:'99.5900654112835')
stock2 = Market.create(stock_name:'MICROSOFT CORPORATION', symbol:'MSFT',volume:'3764',trades:'0',buying_price:'114.546723355292',selling_price:'102.724614803671')
stock3 = Market.create(stock_name:'ALPHABET INC.', symbol:'GOOG',volume:'4014',trades:'0',buying_price:'113.64530274428',selling_price:'113.071093294988')
stock4 = Market.create(stock_name:'AMAZON.COM, INC.', symbol:'AMZN',volume:'4118',trades:'0',buying_price:'113.194633851096',selling_price:'98.0192687958229')
stock5 = Market.create(stock_name:'TESLA, INC.', symbol:'TSLA',volume:'3017',trades:'0',buying_price:'113.002890352375',selling_price:'96.3711112822096')
stock6 = Market.create(stock_name:'Meta Platforms, Inc.', symbol:'FB',volume:'5314',trades:'0',buying_price:'112.840443502741',selling_price:'113.746690470795')
stock7 = Market.create(stock_name:'NVIDIA CORPORATION', symbol:'NVDA',volume:'3154',trades:'0',buying_price:'112.813376662851',selling_price:'107.319595476381')
stock8 = Market.create(stock_name:'BERKSHIRE HATHAWAY INC.', symbol:'BRK.A',volume:'3001',trades:'0',buying_price:'111.809663591472',selling_price:'107.484206022919')
stock9 = Market.create(stock_name:'UNITEDHEALTH GROUP INCORPORATED', symbol:'UNH',volume:'3418',trades:'0',buying_price:'111.800404105483',selling_price:'108.916263910781')
stock10 = Market.create(stock_name:'JPMORGAN CHASE & CO.', symbol:'JPM',volume:'3677',trades:'0',buying_price:'111.568525188606',selling_price:'92.6090317271335')
stock11 = Market.create(stock_name:'VISA INC.', symbol:'V',volume:'3396',trades:'0',buying_price:'110.363282262441',selling_price:'101.598389480089')
stock12 = Market.create(stock_name:'JOHNSON & JOHNSON', symbol:'JNJ',volume:'4973',trades:'0',buying_price:'110.22008406322',selling_price:'94.5005900769394')
stock13 = Market.create(stock_name:'THE HOME DEPOT, INC.', symbol:'HD',volume:'3976',trades:'0',buying_price:'109.7752863988',selling_price:'91.8785441598976')
stock14 = Market.create(stock_name:'WALMART INC.', symbol:'WMT',volume:'5333',trades:'0',buying_price:'109.567840943542',selling_price:'108.403248718763')
stock15 = Market.create(stock_name:'THE PROCTER & GAMBLE COMPANY', symbol:'PG',volume:'5260',trades:'0',buying_price:'109.352531030233',selling_price:'102.106467721954')
stock16 = Market.create(stock_name:'BANK OF AMERICA CORPORATION', symbol:'BAC',volume:'4121',trades:'0',buying_price:'108.438678441001',selling_price:'113.67471194721')
stock17 = Market.create(stock_name:'MASTERCARD INCORPORATED.', symbol:'MA',volume:'4245',trades:'0',buying_price:'108.362163537101',selling_price:'112.660612704867')
stock18 = Market.create(stock_name:'PFIZER INC.', symbol:'PFE',volume:'2932',trades:'0',buying_price:'108.313165735547',selling_price:'102.199456460102')
stock19 = Market.create(stock_name:'THE WALT DISNEY COMPANY', symbol:'DIS',volume:'4804',trades:'0',buying_price:'108.169466404679',selling_price:'99.578611372219')
stock20 = Market.create(stock_name:'Broadcom Inc.', symbol:'AVGO',volume:'4941',trades:'0',buying_price:'106.931342804415',selling_price:'92.6048692796579')
stock21 = Market.create(stock_name:'ACCENTURE PUBLIC LIMITED COMPANY', symbol:'ACN',volume:'5348',trades:'0',buying_price:'105.915258869658',selling_price:'91.2003533564774')
stock22 = Market.create(stock_name:'ADOBE INC.', symbol:'ADBE',volume:'3584',trades:'0',buying_price:'105.554039516264',selling_price:'94.0259332481992')
stock23 = Market.create(stock_name:'CISCO SYSTEMS, INC.', symbol:'CSCO',volume:'3880',trades:'0',buying_price:'105.350822310838',selling_price:'110.507887820033')
stock24 = Market.create(stock_name:'NETFLIX, INC.', symbol:'NFLX',volume:'5507',trades:'0',buying_price:'105.111927902104',selling_price:'104.560553727203')
stock25 = Market.create(stock_name:'ELI LILLY AND COMPANY', symbol:'LLY',volume:'4360',trades:'0',buying_price:'104.566199040123',selling_price:'106.250891882502')
stock26 = Market.create(stock_name:'NIKE, INC.', symbol:'NKE',volume:'4556',trades:'0',buying_price:'104.538210594557',selling_price:'93.3794679690984')
stock27 = Market.create(stock_name:'THERMO FISHER SCIENTIFIC INC.', symbol:'TMO',volume:'4898',trades:'0',buying_price:'103.541380422298',selling_price:'104.599745261415')
stock28 = Market.create(stock_name:'EXXON MOBIL CORPORATION', symbol:'XOM',volume:'3732',trades:'0',buying_price:'102.950932160738',selling_price:'96.531825108604')
stock29 = Market.create(stock_name:'THE COCA-COLA COMPANY', symbol:'KO',volume:'3372',trades:'0',buying_price:'102.674176826061',selling_price:'106.75288979129')
stock30 = Market.create(stock_name:'COSTCO WHOLESALE CORPORATION', symbol:'COST',volume:'4537',trades:'0',buying_price:'102.527491011585',selling_price:'94.8846361874539')
stock31 = Market.create(stock_name:'ABBOTT LABORATORIES', symbol:'ABT',volume:'5070',trades:'0',buying_price:'102.502347188121',selling_price:'104.382396423614')
stock32 = Market.create(stock_name:'SALESFORCE.COM, INC.', symbol:'CRM',volume:'5205',trades:'0',buying_price:'101.146251294052',selling_price:'107.179166526658')
stock33 = Market.create(stock_name:'PEPSICO, INC.', symbol:'PEP',volume:'3130',trades:'0',buying_price:'100.278766871294',selling_price:'103.478495531424')
stock34 = Market.create(stock_name:'ABBVIE INC.', symbol:'ABBV',volume:'3020',trades:'0',buying_price:'99.9950536928877',selling_price:'104.038240631004')
stock35 = Market.create(stock_name:'ORACLE CORPORATION', symbol:'ORCL',volume:'2920',trades:'0',buying_price:'98.5259259313973',selling_price:'111.775269636269')
stock36 = Market.create(stock_name:'DANAHER CORPORATION', symbol:'DHR',volume:'5791',trades:'0',buying_price:'98.2451729087582',selling_price:'94.5824396983952')
stock37 = Market.create(stock_name:'COMCAST CORPORATION', symbol:'CMCSA',volume:'5250',trades:'0',buying_price:'97.441572667409',selling_price:'98.3898416583204')
stock38 = Market.create(stock_name:'CHEVRON CORPORATION', symbol:'CVX',volume:'4326',trades:'0',buying_price:'97.0130454292013',selling_price:'91.7695882312538')
stock39 = Market.create(stock_name:'PAYPAL HOLDINGS, INC.', symbol:'PYPL',volume:'5196',trades:'0',buying_price:'96.9803418047057',selling_price:'97.4276374882998')
stock40 = Market.create(stock_name:'VERIZON COMMUNICATIONS INC.', symbol:'VZ',volume:'3005',trades:'0',buying_price:'96.4829134609436',selling_price:'103.546562419871')
stock41 = Market.create(stock_name:'INTEL CORPORATION', symbol:'INTC',volume:'5195',trades:'0',buying_price:'96.136716661216',selling_price:'94.4890108818041')
stock42 = Market.create(stock_name:'QUALCOMM INCORPORATED', symbol:'QCOM',volume:'4166',trades:'0',buying_price:'96.0105266328079',selling_price:'108.327896055649')
stock43 = Market.create(stock_name:'MCDONALDS CORPORATION', symbol:'MCD',volume:'3997',trades:'0',buying_price:'95.3974153774145',selling_price:'97.2599750171575')
stock44 = Market.create(stock_name:'MERCK & CO., INC.', symbol:'MRK',volume:'5101',trades:'0',buying_price:'95.3339140988172',selling_price:'99.9050977673526')
stock45 = Market.create(stock_name:'WELLS FARGO & COMPANY', symbol:'WFC',volume:'5529',trades:'0',buying_price:'94.3332125486942',selling_price:'99.3531251081212')
stock46 = Market.create(stock_name:'UNITED PARCEL SERVICE, INC.', symbol:'UPS',volume:'5194',trades:'0',buying_price:'93.1853163446727',selling_price:'113.430641013014')
stock47 = Market.create(stock_name:'NEXTERA ENERGY, INC.', symbol:'NEE',volume:'5369',trades:'0',buying_price:'92.7064872355226',selling_price:'97.4351154429564')
stock48 = Market.create(stock_name:'INTUIT INC.', symbol:'INTU',volume:'4562',trades:'0',buying_price:'91.5860705907686',selling_price:'102.731012025778')
stock49 = Market.create(stock_name:'LINDE PUBLIC LIMITED COMPANY', symbol:'LIN',volume:'4652',trades:'0',buying_price:'91.1529940681593',selling_price:'102.90578968951')
stock50 = Market.create(stock_name:'MORGAN STANLEY', symbol:'MS',volume:'3146',trades:'0',buying_price:'91.0859612554714',selling_price:'102.171192342936')

# In the users_controller.rb, add something like
# def set_role
#   if user.user_type == 'Admin'
#     user.add_role(:admin)
#   elsif user.user_type == 'Buyer'
#     user.add_role(:buyer)
#   else
#     # user.add_role(:guest)
#   end
# end
#
# Use after_create :set_role
