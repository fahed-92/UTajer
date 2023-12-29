<?php

return [

    //Exception
    'handler' => [
        'unauthenticated' => 'Unauthenticated'
    ],

    //Helper
    'common' => [
        'invalidDate' => 'Invalid Date: ',
        'invalidPhone' => ':attribute is invalid phone number',
        'passwordRegex' => ':attribute should be at least 8 characters and contain at-least one digit and one special character.',
        'invalidDomain' => ':attribute is invalid Website/Domain'
    ],

    //requests
    'requests' => [
        'baseRequest' => [
            'invalidInputData' => 'Invalid Input Data.'
        ],
        'auth' => [
            'login' => [
                'emailRequired' => 'Please enter email',
                'emailEmail' => 'Invalid Email',
                'passwordRequired' => 'Please enter password',
                'deviceError' => 'Device token is not correct.',
                'incorrectPassword' => 'Incorret password',
                'emailNotExist' => 'Email does not exist.'
            ],
            'register' => [
                'nameRequired' => 'Please Enter Name',
                'nameString' => 'Invalid Name',
                'firstNameRequired' => 'Please Enter first Name',
                'firstNameString' => 'Invalid first Name',
                'lastNameRequired' => 'Please Enter Name',
                'lastNameString' => 'Invalid Last Name',
                'emailRequired' => 'Please Enter Email',
                'emailEmail' => 'Invalid Email',
                'emailUnique' => 'Email Already Taken',
                'phoneRequired' => 'Please enter phone number',
                'passwordRequired' => 'Please enter confirm password',
                'countryRequired' => 'Please select Country',
                'cityRequired' => 'Please enter City',
                'zipCodeRequired' => 'Please enter zip code',
                'addressRequired' => 'Please enter address',
                'dobRequired' => 'Please enter DOB',
                'genderRequired' => 'Please select gender',
                'jobRequired' => 'Please enter job',
                'businessNameRequired' => 'Please enter business name',
                'roleRequire' => 'Invalid Role',
                'roleIn' => 'Invalid role selected.'
            ],
            'registerMailOtp' => [
                'emailRequired' => 'Mail for opt required.',
                'emailEmail' => 'Invalid Mail Address.'
            ],
            'registerMailOtpVerify' => [
                'emailRequired' => 'Mail for opt required.',
                'emailEmail' => 'Invalid Mail Address.',
                'otpRequired' => 'Verification otp required.',
                'otpString' => 'Otp must be a string.'
            ]
        ]
    ],

    //middleware
    'middleware' => [
        'statusCodeMessage' => [
            '100' => 'Continue',
            '101' => 'Switching Protocols',
            '102' => 'Processing',
            '103' => 'Early Hints',
            '200' => 'OK',
            '201' => 'Created',
            '202' => 'Accepted',
            '203' => 'Non-Authoritative Information',
            '204' => 'No Content',
            '205' => 'Reset Content',
            '206' => 'Partial Content',
            '207' => 'Multi-Status',
            '208' => 'Already Reported',
            '226' => 'IM Used',
            '300' => 'Multiple Choices',
            '301' => 'Moved Permanently',
            '302' => 'Moved Temporarily',
            '303' => 'See Other',
            '304' => 'Not Modified',
            '305' => 'Use Proxy',
            '306' => 'Switch Proxy',
            '307' => 'Temporary Redirect',
            '308' => 'Permanent Redirect',
            '400' => 'Bad Request',
            '401' => 'Unauthorized',
            '402' => 'Payment Required',
            '403' => 'Forbidden',
            '404' => 'Not Found',
            '405' => 'Method Not Allowed',
            '406' => 'Not Acceptable',
            '407' => 'Proxy Authentication Required',
            '408' => 'Request Time-out',
            '409' => 'Conflict',
            '410' => 'Gone',
            '411' => 'Length Required',
            '412' => 'Precondition Failed',
            '413' => 'Request Entity Too Large',
            '414' => 'Request-URI Too Large',
            '415' => 'Unsupported Media Type',
            '416' => 'Range Not Satisfiable',
            '417' => 'Expectation Failed',
            '418' => 'I\'m a teapot',
            '421' => 'Misdirected Request',
            '422' => 'Unprocessable Entity',
            '423' => 'Locked',
            '424' => 'Failed Dependency',
            '425' => 'Too Early',
            '426' => 'Upgrade Required',
            '428' => 'Precondition Required',
            '429' => 'Too Many Requests',
            '431' => 'Request Header Fields Too Large',
            '451' => 'Unavailable For Legal Reasons',
            '500' => 'Internal Server Error',
            '501' => 'Not Implemented',
            '502' => 'Bad Gateway',
            '503' => 'Service Unavailable',
            '504' => 'Gateway Time-out',
            '505' => 'HTTP Version not supported',
            '506' => 'Variant Also Negotiates',
            '507' => 'Insufficient Storage',
            '508' => 'Loop Detected',
            '510' => 'Not Extended',
            '511' => 'Network Authentication Required',
            'unknown' => 'Unknown http status code'
        ],
    ],

    //controller
    'controller' => [
        'api' => [
            'v1' => [
                'infoController' => [
                    'basicInfoData' => 'Basic Info Data.',
                ],
                'userController' => [
                    'UserInfoData' => 'User Details.',
                    'UpdateUserInfo' => 'Update User info Successfully.',
                    'changePasswordSuccessfully'

                ],
            ]
        ],
        'auth' => [
            'apAuthController' => [
                'userRegistered' => 'User registered',
                'emailNotVerifyCheckEmail' => 'Email not verified. Please check your email.',
                'loginSuccess' => 'Login Success',
                'unauthenticated' => 'Unauthenticated',
                'registerOtpSendSuccessfully' => 'Register Otp Send Successfully',
                'registerOtpSendFailed' => 'Register Otp Send failed',
                'registerMailOtpVerifiedSuccessfully' => 'Register Otp Verified Successfully',
                'registerMailOtpVerificationFailed' => 'Register Otp Verification Failed',
                'logoutUserSuccessfully' => 'User logout Successfully.',
                'userNotFound' => 'User not found.',
                'statusAlreadyCompleted' => 'Status is already completed',
                'storeNotFound' => 'Store not Found.',
                'OrderMyList'=>'My Order List',
                'bankNotFound' => 'Payout Details not Found. Please Attach Your Bank Details.',
                'balanceIsLow' => 'Requested balance is greater than your account balance.',
                'IncorrectOldPassword' => 'Incorrect old Password.',
                'changePasswordSuccessfully' => 'Password changed  Successfully.',
                'changeLanguageSuccessfully' => 'Language changed  Successfully.',
                'changePasswordFailed' => 'Password could not reset.',
                'changeLanguageFailed' => 'language could not change.',
                'deviceTokenRequired' => 'Please enter device token.',
                'alreadyExistUser' => 'User Already exist.',
                'uploadDocumentSuccessfully' => 'Upload Document Successfully.',
                'uploadDocumentFailed' => 'Upload Document Failed.',
                'OrderListData' => 'Order list.',
                'OrderHistoryData' => 'Order History list.',
                'ProductListing' => 'List of Product',
                'AccountSetting' => 'Account Setting',
                'ProductDetail' => 'Product Detail',
                'addReview' => 'Added Review Successfully.',
                'ProductReviewList' => 'Product Review list.',
                'Productfav' => 'Added to your favourites.',
                'Wishlist' => 'Your Wishlist',
                'ProductNotFav' => 'Removed from your favourites.',
                'AddToCart' => 'Added to Cart',
                'RemoveFromCart' => 'Removed From Cart',
                'CartList' => 'Cart List ',
                'SearchResult' => 'Search Result',
                'NoSearchResult' => 'No Data Found',
                'CategoryList' => 'List of Category',
                'SimilarProducts' => 'Similar Products',
                'FilterTags' => 'Filter Tags',
                'editCart' => 'Update cart Successfully',
                'FAQ' => 'FAQ',
                'AddBillingAddress' => 'Added address Successfully.',
                'AddShippingAddress' => 'Added address Successfully.',
                'OrderCreate' => 'Order Created Successfully.',
                'UpdateBillingAddress' => 'Updated Address Successfully.',
                'DeleteBillingAddress' => 'Deleted Address Successfully.',
                'ListBillingAddress' => 'List of Billing Addresses.',
                'ChangeDefaultBillingAddress' => 'Changed Default Billing Address Successfully.',
                'ChangeDefaultShippingAddress' => 'Changed Default Shipping Address Successfully.',
                'ProductChargesDetails' => 'Product Charges Details.',
                'ProductDicountDetails' => 'Product Discount Details.',
                'Contact' => 'Your query has been submitted.',
                'ProductReturn' => 'Your return request has been submitted.',
                'ListShippingAddress' => 'List of shipping address',
                'CustomerCreated' => 'Customer Created Successfully.',
                'AddUserCardDetails' => 'Added User Card Details Successfully.',
                'UpdateUserCardDetails' => 'Updated Card Details Successfully.',
                'DeleteUserCardDetails' => 'Deleted Card Details Successfully.',
                'ListUserCardDetails' => 'User Card List Successfully.',
                'ChangeDefaultUserCardDetails' => 'Changed Default User Card Successfully.',
                'SubCategoryList' => 'List of Sub categories.',
                'SubCategoryProduct' => 'List of Product Sub categories.',
                'Offers' => 'Offers.',
                'ReturnPolicy' => 'Return Policy.',
                'TermsAndConditions' => 'Terms & Conditions.',
                'OfferProduct' => 'Offers Products',
                'DownloadInvoice' => 'Download Invoice',
                'OrderPlacedConfirmation' => 'Order Placed Confirmation',
                'OrderReturnList' => 'Order Return List',
                'OrderHistoryDetails' => 'Order History Details.',
                'PaymentSuccessfull' => 'Payment Successfull.',
                'TokenCreated' => 'Token Created Successfully.',
                'PaymentSavedSuccessfull' => 'Data saved Successfully.',
                'ProductsList' => 'Get Product List.',
                'ProductsListUpdate' => 'Product list Updated Successfully.',
                'ProductAddedSuccessfully' => 'Product Added Successfully.',
            ],
            'registerController' => [
                'registeredSuccessfully' => 'Registered Successfully.',
                'failedRegisteration'    => 'Something went wrong.',
            ],
            'loginController' => [
                'waitForVerify' => 'Please wait for admin to verify your account.'
            ]
        ],
        'repository' => [
            'systemRepo' => [
                'index' => [
                    'systemSettingUpdated' => 'Setting settings updated'
                ]
            ]
        ]
    ],

    //user model
    'model' => [
        'address' => [
            'type' => [
                'billing' => 'Billing',
                'shipping' => 'Shipping'
            ]
        ],
        'category' => [
            'status' => [
                'enabled' => 'Enabled',
                'disabled' => 'Disabled',
            ],
            'featured' => [
                'enabled' => 'Enabled',
                'disabled' => 'Disabled',
            ],
        ],
        'user' => [
            'role' => [
                'systemAdmin' => 'System Admin',
                'vendor' => 'Seller',
                'customer' => 'Buyer'
            ],
            'status' => [
                'active' => 'Active',
                'inactive' => 'Inactive',
                'pending' => 'Pending',
                'deleted' => 'Deleted',
            ],
        ],
        'system' => [
            'request' => [
                'siteName' => [
                    'label' => 'Enter Site Name',
                    'messagesSiteNameString' => 'Invalid Site Name.'
                ],
                'systemBlackLogoIcon' => [
                    'label' => 'system Black Logo Icon',
                    'messagesSystemBlackLogoIconMime' => 'Please Select Correct File Format',
                ],
                'systemWhiteLogoIcon' => [
                    'label' => 'System White Logo Icon',
                    'messagesSystemWhiteLogoIconMime' => 'Please Select Correct File Format',
                ],
                'systemBlackXlLogo' => [
                    'label' => 'System Black Xl Logo',
                    'messagesSystemBlackXlLogoMime' => 'Please Select Correct File Format',
                ],
                'systemWhiteXlLogo' => [
                    'label' => 'System White Xl Logo',
                    'messagesSystemWhiteXlLogoMime' => 'Please Select Correct File Format',
                ],
                'systemBlackXsLogo' => [
                    'label' => 'System Black Xs Logo',
                    'messagesSystemBlackXsLogoMime' => 'Please Select Correct File Format',
                ],
                'systemWhiteXsLogo' => [
                    'label' => 'System White Xs Logo',
                    'messagesSystemWhiteXsLogoMime' => 'Please Select Correct File Format',
                ],
            ]
        ]
    ],

    //views
    'auth' => [],
    'layouts' => [
        'backend' => [
            '_includes' => [
                'sidebar' => [
                    'dashboard' => 'Dashboard',
                    'frameMode' => 'Frame Mode'
                ],
                'contentHeader' => [
                    'dashboard' => 'Dashboard',
                    'home' => 'Home',
                ],
                'footer' => [
                    'version' => 'Version',
                    'allRightsReserved' => 'All rights reserved.',
                    'copyright' => 'Copyright',
                ],
            ]
        ],
    ],
    'backend' => [

    ],
    'frontend' => [

    ],
    'system' => [

    ],
    'mail' => [
        'registerMailOtp' => [
            'otpForYourRegistration' => 'Otp For your registration'
        ],
    ]
];
