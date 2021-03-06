#!/usr/bin/perl

no utf8;

# Net::Radius test input
# Made with $Id: broadsoft-areq-00.p 71 2007-01-14 19:00:44Z lem $

$VAR1 = {
          'packet' => 'Y}~���D�ެc@���մ�"(   ,#18814:0835c99c720050803123811.970�   12.0(2137835c99c720050803123811.9701+040000	CTI_LabNormal9933+70957852525
Originating9933Public	4444
20050803123811.970
1+040000NoVOIP4444*n-	18814:0yivan9933@cti.ruzVoice Portal{Public213.180.220.171N  1000ab776-a7440003-50a88d1d-529e89fb@172.17.21.4 
engineering/
Ordinary',
          'secret' => '',
          'description' => 'BroadSoft Acct-Req (Contributed by j7)',
          'authenticator' => '~���D�ެc@���',
          'identifier' => 89,
          'dictionary' => bless( {
                                   'packet' => undef,
                                   'vsattr' => {
                                                 '6431' => {
                                                             'BWAS-Hoteling-Group' => [
                                                                                        '129',
                                                                                        'string'
                                                                                      ],
                                                             'BWAS-Sac-Lock-Invoke-Time' => [
                                                                                              '105',
                                                                                              'string'
                                                                                            ],
                                                             'BWAS-Conference-Callid' => [
                                                                                           '49',
                                                                                           'string'
                                                                                         ],
                                                             'BWAS-Calling-Party-Category' => [
                                                                                                '47',
                                                                                                'string'
                                                                                              ],
                                                             'BWAS-Directed-Call-Pickup-Invoke-Time' => [
                                                                                                          '75',
                                                                                                          'string'
                                                                                                        ],
                                                             'BWAS-Conference-Role' => [
                                                                                         '53',
                                                                                         'string'
                                                                                       ],
                                                             'BWAS-VP-Calling-Invoke-Time' => [
                                                                                                '44',
                                                                                                'string'
                                                                                              ],
                                                             'BWAS-Acc-Per-Call-Invoke-Time' => [
                                                                                                  '63',
                                                                                                  'string'
                                                                                                ],
                                                             'BWAS-Conference-Owner-Dn' => [
                                                                                             '56',
                                                                                             'string'
                                                                                           ],
                                                             'BWAS-Spare-31' => [
                                                                                  '31',
                                                                                  'string'
                                                                                ],
                                                             'BWAS-Call-Detail-Record-Version' => [
                                                                                                    0,
                                                                                                    'string'
                                                                                                  ],
                                                             'BWAS-Type-Of-Network' => [
                                                                                         '43',
                                                                                         'string'
                                                                                       ],
                                                             'BWAS-Cfb-Deact-Fac-Result' => [
                                                                                              '88',
                                                                                              'string'
                                                                                            ],
                                                             'BWAS-Cfna-Deact-Invoke-Time' => [
                                                                                                '91',
                                                                                                'string'
                                                                                              ],
                                                             'BWAS-Authorization-Code' => [
                                                                                            '35',
                                                                                            'string'
                                                                                          ],
                                                             'BWAS-Acb-Deact-Fac-Result' => [
                                                                                              '68',
                                                                                              'string'
                                                                                            ],
                                                             'BWAS-Conference-Owner' => [
                                                                                          '55',
                                                                                          'string'
                                                                                        ],
                                                             'BWAS-Start-Time' => [
                                                                                    '10',
                                                                                    'string'
                                                                                  ],
                                                             'BWAS-Hoteling-UserId' => [
                                                                                         '130',
                                                                                         'string'
                                                                                       ],
                                                             'BWAS-Call-Park-Retr-Fac-Result' => [
                                                                                                   '72',
                                                                                                   'string'
                                                                                                 ],
                                                             'BWAS-Call-Category' => [
                                                                                       '19',
                                                                                       'string'
                                                                                     ],
                                                             'BWAS-Codec' => [
                                                                               '26',
                                                                               'string'
                                                                             ],
                                                             'BWAS-Conference-From' => [
                                                                                         '51',
                                                                                         'string'
                                                                                       ],
                                                             'BWAS-Network-Type' => [
                                                                                      '16',
                                                                                      'string'
                                                                                    ],
                                                             'BWAS-Sac-Unlock-Invoke-Time' => [
                                                                                                '107',
                                                                                                'string'
                                                                                              ],
                                                             'BWAS-Conference-Bridge' => [
                                                                                           '54',
                                                                                           'string'
                                                                                         ],
                                                             'BWAS-Last-Number-Redial-Fac-Result' => [
                                                                                                       '112',
                                                                                                       'string'
                                                                                                     ],
                                                             'BWAS-User-Timezone' => [
                                                                                       '11',
                                                                                       'string'
                                                                                     ],
                                                             'BWAS-Cfb-Deact-Invoke-Time' => [
                                                                                               '87',
                                                                                               'string'
                                                                                             ],
                                                             'BWAS-Sac-Lock-Fac-Result' => [
                                                                                             '106',
                                                                                             'string'
                                                                                           ],
                                                             'BWAS-Cfna-Act-Invoke-Time' => [
                                                                                              '89',
                                                                                              'string'
                                                                                            ],
                                                             'BWAS-Redirecting-Presentation-Indic' => [
                                                                                                        '40',
                                                                                                        'string'
                                                                                                      ],
                                                             'BWAS-Calling-Presentation-Indic' => [
                                                                                                    '8',
                                                                                                    'string'
                                                                                                  ],
                                                             'BWAS-Dpubi-Fac-Result' => [
                                                                                          '78',
                                                                                          'string'
                                                                                        ],
                                                             'BWAS-Other-Party-Name-Pres-Indic' => [
                                                                                                     '123',
                                                                                                     'string'
                                                                                                   ],
                                                             'BWAS-Cfna-Deact-Fac-Result' => [
                                                                                               '92',
                                                                                               'string'
                                                                                             ],
                                                             'BWAS-Original-Called-Presentation-Indic' => [
                                                                                                            '37',
                                                                                                            'string'
                                                                                                          ],
                                                             'BWAS-Redirecting-Number' => [
                                                                                            '39',
                                                                                            'string'
                                                                                          ],
                                                             'BWAS-Conference-Invoke-Time' => [
                                                                                                '48',
                                                                                                'string'
                                                                                              ],
                                                             'BWAS-Dnd-Deact-Invoke-Time' => [
                                                                                               '103',
                                                                                               'string'
                                                                                             ],
                                                             'BWAS-Record-id' => [
                                                                                   '1',
                                                                                   'string'
                                                                                 ],
                                                             'BWAS-Clid-Blocking-Per-Call-Fac-Result' => [
                                                                                                           '96',
                                                                                                           'string'
                                                                                                         ],
                                                             'BWAS-Conference-Id' => [
                                                                                       '52',
                                                                                       'string'
                                                                                     ],
                                                             'BWAS-Return-Call-Fac-Result' => [
                                                                                                '114',
                                                                                                'string'
                                                                                              ],
                                                             'BWAS-Call-Park-Fac-Result' => [
                                                                                              '70',
                                                                                              'string'
                                                                                            ],
                                                             'BWAS-Hoteling-Invoke-Time' => [
                                                                                              '128',
                                                                                              'string'
                                                                                            ],
                                                             'BWAS-Direct-Vm-Xfer-Invoke-Time' => [
                                                                                                    '99',
                                                                                                    'string'
                                                                                                  ],
                                                             'BWAS-Cfna-Act-Fac-Result' => [
                                                                                             '90',
                                                                                             'string'
                                                                                           ],
                                                             'BWAS-Hoteling-Group-Number' => [
                                                                                               '132',
                                                                                               'string'
                                                                                             ],
                                                             'BWAS-Termination-Cause' => [
                                                                                           '15',
                                                                                           'string'
                                                                                         ],
                                                             'BWAS-Directed-Call-Pickup-Fac-Result' => [
                                                                                                         '76',
                                                                                                         'string'
                                                                                                       ],
                                                             'BWAS-Group-Number' => [
                                                                                      '5',
                                                                                      'string'
                                                                                    ],
                                                             'BWAS-Group' => [
                                                                               '32',
                                                                               'string'
                                                                             ],
                                                             'BWAS-Original-Called-Reason' => [
                                                                                                '38',
                                                                                                'string'
                                                                                              ],
                                                             'BWAS-Clear-Mwi-Invoke-Time' => [
                                                                                               '119',
                                                                                               'string'
                                                                                             ],
                                                             'BWAS-Call-Pickup-Invoke-Time' => [
                                                                                                 '73',
                                                                                                 'string'
                                                                                               ],
                                                             'BWAS-Original-Called-Number' => [
                                                                                                '36',
                                                                                                'string'
                                                                                              ],
                                                             'BWAS-Dpubi-Invoke-Time' => [
                                                                                           '77',
                                                                                           'string'
                                                                                         ],
                                                             'BWAS-Network-Callid' => [
                                                                                        '25',
                                                                                        'string'
                                                                                      ],
                                                             'BWAS-Called-Number' => [
                                                                                       '9',
                                                                                       'string'
                                                                                     ],
                                                             'BWAS-Clid-Delivery-Per-Call-Invoke-Time' => [
                                                                                                            '93',
                                                                                                            'string'
                                                                                                          ],
                                                             'BWAS-Moh-Deact-Fac-Result' => [
                                                                                              '125',
                                                                                              'string'
                                                                                            ],
                                                             'BWAS-Answer-Indic' => [
                                                                                      '12',
                                                                                      'string'
                                                                                    ],
                                                             'BWAS-Cfa-Deact-Fac-Result' => [
                                                                                              '84',
                                                                                              'string'
                                                                                            ],
                                                             'BWAS-Call-Park-Retr-Invoke-Time' => [
                                                                                                    '71',
                                                                                                    'string'
                                                                                                  ],
                                                             'BWAS-Clid-Delivery-Per-Call-Fac-Result' => [
                                                                                                           '94',
                                                                                                           'string'
                                                                                                         ],
                                                             'BWAS-Acb-Act-Fac-Result' => [
                                                                                            '66',
                                                                                            'string'
                                                                                          ],
                                                             'BWAS-Releasing-Party' => [
                                                                                         '23',
                                                                                         'string'
                                                                                       ],
                                                             'BWAS-Charging-Vection-Orig' => [
                                                                                               '61',
                                                                                               'string'
                                                                                             ],
                                                             'BWAS-Dnd-Act-Invoke-Time' => [
                                                                                             '101',
                                                                                             'string'
                                                                                           ],
                                                             'BWAS-Access-Callid' => [
                                                                                       '28',
                                                                                       'string'
                                                                                     ],
                                                             'BWAS-Cot-Fac-Result' => [
                                                                                        '98',
                                                                                        'string'
                                                                                      ],
                                                             'BWAS-Sd8-Programming-Invoke-Time' => [
                                                                                                     '117',
                                                                                                     'string'
                                                                                                   ],
                                                             'BWAS-Release-Time' => [
                                                                                      '14',
                                                                                      'string'
                                                                                    ],
                                                             'BWAS-Carrier-Identification-Code' => [
                                                                                                     '17',
                                                                                                     'string'
                                                                                                   ],
                                                             'BWAS-Route' => [
                                                                               '24',
                                                                               'string'
                                                                             ],
                                                             'BWAS-Cancel-Cwt-Per-Call-Invoke-Time' => [
                                                                                                         '79',
                                                                                                         'string'
                                                                                                       ],
                                                             'BWAS-Network-Translated-Number' => [
                                                                                                   '21',
                                                                                                   'string'
                                                                                                 ],
                                                             'BWAS-User-Number' => [
                                                                                     '4',
                                                                                     'string'
                                                                                   ],
                                                             'BWAS-Acc-Per-Call-Fac-Result' => [
                                                                                                 '64',
                                                                                                 'string'
                                                                                               ],
                                                             'BWAS-Type' => [
                                                                              '3',
                                                                              'string'
                                                                            ],
                                                             'BWAS-Department' => [
                                                                                    '33',
                                                                                    'string'
                                                                                  ],
                                                             'BWAS-Account-Code' => [
                                                                                      '34',
                                                                                      'string'
                                                                                    ],
                                                             'BWAS-Service-provider' => [
                                                                                          '2',
                                                                                          'string'
                                                                                        ],
                                                             'BWAS-Cfa-Act-Fac-Result' => [
                                                                                            '82',
                                                                                            'string'
                                                                                          ],
                                                             'BWAS-Cfa-Deact-Invoke-Time' => [
                                                                                               '83',
                                                                                               'string'
                                                                                             ],
                                                             'BWAS-Direct-Vm-Xfer-Fac-Result' => [
                                                                                                   '100',
                                                                                                   'string'
                                                                                                 ],
                                                             'BWAS-Network-Call-Type' => [
                                                                                           '20',
                                                                                           'string'
                                                                                         ],
                                                             'BWAS-Call-Pickup-Fac-Result' => [
                                                                                                '74',
                                                                                                'string'
                                                                                              ],
                                                             'BWAS-Charging-Vection-Creator' => [
                                                                                                  '60',
                                                                                                  'string'
                                                                                                ],
                                                             'BWAS-Other-Party-Name' => [
                                                                                          '122',
                                                                                          'string'
                                                                                        ],
                                                             'BWAS-Conference-To' => [
                                                                                       '50',
                                                                                       'string'
                                                                                     ],
                                                             'BWAS-Dnd-Act-Fac-Result' => [
                                                                                            '102',
                                                                                            'string'
                                                                                          ],
                                                             'BWAS-Conference-Project-Code' => [
                                                                                                 '58',
                                                                                                 'string'
                                                                                               ],
                                                             'BWAS-Clid-Blocking-Per-Call-Invoke-Time' => [
                                                                                                            '95',
                                                                                                            'string'
                                                                                                          ],
                                                             'BWAS-Push-to-Talk-Invoke-Time' => [
                                                                                                  '126',
                                                                                                  'string'
                                                                                                ],
                                                             'BWAS-Spare-29' => [
                                                                                  '29',
                                                                                  'string'
                                                                                ],
                                                             'BWAS-Acb-Act-Invoke-Time' => [
                                                                                             '65',
                                                                                             'string'
                                                                                           ],
                                                             'BWAS-Cfa-Act-Invoke-Time' => [
                                                                                             '81',
                                                                                             'string'
                                                                                           ],
                                                             'BWAS-Local-Callid' => [
                                                                                      '45',
                                                                                      'string'
                                                                                    ],
                                                             'BWAS-Sac-Unlock-Fac-Result' => [
                                                                                               '108',
                                                                                               'string'
                                                                                             ],
                                                             'BWAS-Redirecting-Reason' => [
                                                                                            '41',
                                                                                            'string'
                                                                                          ],
                                                             'BWAS-Call-Park-Invoke-Time' => [
                                                                                               '69',
                                                                                               'string'
                                                                                             ],
                                                             'BWAS-Clear-Mwi-Fac-Result' => [
                                                                                              '120',
                                                                                              'string'
                                                                                            ],
                                                             'BWAS-Dnd-Deact-Fac-Result' => [
                                                                                              '104',
                                                                                              'string'
                                                                                            ],
                                                             'BWAS-Flash-Call-Hold-Invoke-Time' => [
                                                                                                     '109',
                                                                                                     'string'
                                                                                                   ],
                                                             'BWAS-Calling-Number' => [
                                                                                        '7',
                                                                                        'string'
                                                                                      ],
                                                             'BWAS-Dialed-Digits' => [
                                                                                       '18',
                                                                                       'string'
                                                                                     ],
                                                             'BWAS-Acb-Deact-Invoke-Time' => [
                                                                                               '67',
                                                                                               'string'
                                                                                             ],
                                                             'BWAS-Remote-Callid' => [
                                                                                       '46',
                                                                                       'string'
                                                                                     ],
                                                             'BWAS-Charging-Vector-Key' => [
                                                                                             '59',
                                                                                             'string'
                                                                                           ],
                                                             'BWAS-Network-Translated-Group' => [
                                                                                                  '22',
                                                                                                  'string'
                                                                                                ],
                                                             'BWAS-Cfb-Act-Invoke-Time' => [
                                                                                             '85',
                                                                                             'string'
                                                                                           ],
                                                             'BWAS-Cfb-Act-Fac-Result' => [
                                                                                            '86',
                                                                                            'string'
                                                                                          ],
                                                             'BWAS-Sd100-Programming-Invoke-Time' => [
                                                                                                       '115',
                                                                                                       'string'
                                                                                                     ],
                                                             'BWAS-Cot-Invoke-Time' => [
                                                                                         '97',
                                                                                         'string'
                                                                                       ],
                                                             'BWAS-Flash-Call-Hold-Fac-Result' => [
                                                                                                    '110',
                                                                                                    'string'
                                                                                                  ],
                                                             'BWAS-Return-Call-Invoke-Time' => [
                                                                                                 '113',
                                                                                                 'string'
                                                                                               ],
                                                             'BWAS-UserId' => [
                                                                                '121',
                                                                                'string'
                                                                              ],
                                                             'BWAS-Cancel-Cwt-Per-Call-Fac-Result' => [
                                                                                                        '80',
                                                                                                        'string'
                                                                                                      ],
                                                             'BWAS-Sd8-Programming-Fac-Result' => [
                                                                                                    '118',
                                                                                                    'string'
                                                                                                  ],
                                                             'BWAS-Charge-Indic' => [
                                                                                      '42',
                                                                                      'string'
                                                                                    ],
                                                             'BWAS-Failover-Correlation-Id' => [
                                                                                                 '30',
                                                                                                 'string'
                                                                                               ],
                                                             'BWAS-Answer-Time' => [
                                                                                     '13',
                                                                                     'string'
                                                                                   ],
                                                             'BWAS-Hoteling-User-Number' => [
                                                                                              '131',
                                                                                              'string'
                                                                                            ],
                                                             'BWAS-Access-Device-Address' => [
                                                                                               '27',
                                                                                               'string'
                                                                                             ],
                                                             'BWAS-Push-to-Talk-Fac-Result' => [
                                                                                                 '127',
                                                                                                 'string'
                                                                                               ],
                                                             'BWAS-Conference-Title' => [
                                                                                          '57',
                                                                                          'string'
                                                                                        ],
                                                             'BWAS-Direction' => [
                                                                                   '6',
                                                                                   'string'
                                                                                 ],
                                                             'BWAS-Sd100-Programming-Fac-Result' => [
                                                                                                      '116',
                                                                                                      'string'
                                                                                                    ],
                                                             'BWAS-Charging-Vection-Term' => [
                                                                                               '62',
                                                                                               'string'
                                                                                             ],
                                                             'BWAS-Last-Number-Redial-Invoke-Time' => [
                                                                                                        '111',
                                                                                                        'string'
                                                                                                      ]
                                                           }
                                               },
                                   'rattr' => {
                                                '4' => [
                                                         'NAS-IP-Address',
                                                         'ipaddr'
                                                       ],
                                                '40' => [
                                                          'Acct-Status-Type',
                                                          'integer'
                                                        ],
                                                '44' => [
                                                          'Acct-Session-Id',
                                                          'string'
                                                        ]
                                              },
                                   'vendors' => {
                                                  'BroadSoft' => '6431'
                                                },
                                   'rpacket' => undef,
                                   'val' => {
                                              '40' => {
                                                        'Start' => '1'
                                                      }
                                            },
                                   'rvsaval' => {},
                                   'attr' => {
                                               'Acct-Session-Id' => [
                                                                      '44',
                                                                      'string'
                                                                    ],
                                               'Acct-Status-Type' => [
                                                                       '40',
                                                                       'integer'
                                                                     ],
                                               'NAS-IP-Address' => [
                                                                     '4',
                                                                     'ipaddr'
                                                                   ]
                                             },
                                   'rvsattr' => {
                                                  '6431' => {
                                                              '127' => [
                                                                         'BWAS-Push-to-Talk-Fac-Result',
                                                                         'string'
                                                                       ],
                                                              '32' => [
                                                                        'BWAS-Group',
                                                                        'string'
                                                                      ],
                                                              '90' => [
                                                                        'BWAS-Cfna-Act-Fac-Result',
                                                                        'string'
                                                                      ],
                                                              '118' => [
                                                                         'BWAS-Sd8-Programming-Fac-Result',
                                                                         'string'
                                                                       ],
                                                              '71' => [
                                                                        'BWAS-Call-Park-Retr-Invoke-Time',
                                                                        'string'
                                                                      ],
                                                              '102' => [
                                                                         'BWAS-Dnd-Act-Fac-Result',
                                                                         'string'
                                                                       ],
                                                              '18' => [
                                                                        'BWAS-Dialed-Digits',
                                                                        'string'
                                                                      ],
                                                              '125' => [
                                                                         'BWAS-Moh-Deact-Fac-Result',
                                                                         'string'
                                                                       ],
                                                              '16' => [
                                                                        'BWAS-Network-Type',
                                                                        'string'
                                                                      ],
                                                              '44' => [
                                                                        'BWAS-VP-Calling-Invoke-Time',
                                                                        'string'
                                                                      ],
                                                              '55' => [
                                                                        'BWAS-Conference-Owner',
                                                                        'string'
                                                                      ],
                                                              '84' => [
                                                                        'BWAS-Cfa-Deact-Fac-Result',
                                                                        'string'
                                                                      ],
                                                              '27' => [
                                                                        'BWAS-Access-Device-Address',
                                                                        'string'
                                                                      ],
                                                              '95' => [
                                                                        'BWAS-Clid-Blocking-Per-Call-Invoke-Time',
                                                                        'string'
                                                                      ],
                                                              '57' => [
                                                                        'BWAS-Conference-Title',
                                                                        'string'
                                                                      ],
                                                              '20' => [
                                                                        'BWAS-Network-Call-Type',
                                                                        'string'
                                                                      ],
                                                              '109' => [
                                                                         'BWAS-Flash-Call-Hold-Invoke-Time',
                                                                         'string'
                                                                       ],
                                                              '89' => [
                                                                        'BWAS-Cfna-Act-Invoke-Time',
                                                                        'string'
                                                                      ],
                                                              '31' => [
                                                                        'BWAS-Spare-31',
                                                                        'string'
                                                                      ],
                                                              '35' => [
                                                                        'BWAS-Authorization-Code',
                                                                        'string'
                                                                      ],
                                                              '11' => [
                                                                        'BWAS-User-Timezone',
                                                                        'string'
                                                                      ],
                                                              '78' => [
                                                                        'BWAS-Dpubi-Fac-Result',
                                                                        'string'
                                                                      ],
                                                              '93' => [
                                                                        'BWAS-Clid-Delivery-Per-Call-Invoke-Time',
                                                                        'string'
                                                                      ],
                                                              '106' => [
                                                                         'BWAS-Sac-Lock-Fac-Result',
                                                                         'string'
                                                                       ],
                                                              '65' => [
                                                                        'BWAS-Acb-Act-Invoke-Time',
                                                                        'string'
                                                                      ],
                                                              '29' => [
                                                                        'BWAS-Spare-29',
                                                                        'string'
                                                                      ],
                                                              '114' => [
                                                                         'BWAS-Return-Call-Fac-Result',
                                                                         'string'
                                                                       ],
                                                              '58' => [
                                                                        'BWAS-Conference-Project-Code',
                                                                        'string'
                                                                      ],
                                                              '15' => [
                                                                        'BWAS-Termination-Cause',
                                                                        'string'
                                                                      ],
                                                              '81' => [
                                                                        'BWAS-Cfa-Act-Invoke-Time',
                                                                        'string'
                                                                      ],
                                                              '60' => [
                                                                        'BWAS-Charging-Vection-Creator',
                                                                        'string'
                                                                      ],
                                                              '101' => [
                                                                         'BWAS-Dnd-Act-Invoke-Time',
                                                                         'string'
                                                                       ],
                                                              '73' => [
                                                                        'BWAS-Call-Pickup-Invoke-Time',
                                                                        'string'
                                                                      ],
                                                              '86' => [
                                                                        'BWAS-Cfb-Act-Fac-Result',
                                                                        'string'
                                                                      ],
                                                              '76' => [
                                                                        'BWAS-Directed-Call-Pickup-Fac-Result',
                                                                        'string'
                                                                      ],
                                                              '62' => [
                                                                        'BWAS-Charging-Vection-Term',
                                                                        'string'
                                                                      ],
                                                              '67' => [
                                                                        'BWAS-Acb-Deact-Invoke-Time',
                                                                        'string'
                                                                      ],
                                                              '129' => [
                                                                         'BWAS-Hoteling-Group',
                                                                         'string'
                                                                       ],
                                                              '2' => [
                                                                       'BWAS-Service-provider',
                                                                       'string'
                                                                     ],
                                                              '17' => [
                                                                        'BWAS-Carrier-Identification-Code',
                                                                        'string'
                                                                      ],
                                                              '110' => [
                                                                         'BWAS-Flash-Call-Hold-Fac-Result',
                                                                         'string'
                                                                       ],
                                                              '82' => [
                                                                        'BWAS-Cfa-Act-Fac-Result',
                                                                        'string'
                                                                      ],
                                                              '14' => [
                                                                        'BWAS-Release-Time',
                                                                        'string'
                                                                      ],
                                                              '112' => [
                                                                         'BWAS-Last-Number-Redial-Fac-Result',
                                                                         'string'
                                                                       ],
                                                              '69' => [
                                                                        'BWAS-Call-Park-Invoke-Time',
                                                                        'string'
                                                                      ],
                                                              '49' => [
                                                                        'BWAS-Conference-Callid',
                                                                        'string'
                                                                      ],
                                                              '24' => [
                                                                        'BWAS-Route',
                                                                        'string'
                                                                      ],
                                                              '104' => [
                                                                         'BWAS-Dnd-Deact-Fac-Result',
                                                                         'string'
                                                                       ],
                                                              '131' => [
                                                                         'BWAS-Hoteling-User-Number',
                                                                         'string'
                                                                       ],
                                                              '121' => [
                                                                         'BWAS-UserId',
                                                                         'string'
                                                                       ],
                                                              '79' => [
                                                                        'BWAS-Cancel-Cwt-Per-Call-Invoke-Time',
                                                                        'string'
                                                                      ],
                                                              '0' => [
                                                                       'BWAS-Call-Detail-Record-Version',
                                                                       'string'
                                                                     ],
                                                              '23' => [
                                                                        'BWAS-Releasing-Party',
                                                                        'string'
                                                                      ],
                                                              '96' => [
                                                                        'BWAS-Clid-Blocking-Per-Call-Fac-Result',
                                                                        'string'
                                                                      ],
                                                              '126' => [
                                                                         'BWAS-Push-to-Talk-Invoke-Time',
                                                                         'string'
                                                                       ],
                                                              '47' => [
                                                                        'BWAS-Calling-Party-Category',
                                                                        'string'
                                                                      ],
                                                              '8' => [
                                                                       'BWAS-Calling-Presentation-Indic',
                                                                       'string'
                                                                     ],
                                                              '98' => [
                                                                        'BWAS-Cot-Fac-Result',
                                                                        'string'
                                                                      ],
                                                              '37' => [
                                                                        'BWAS-Original-Called-Presentation-Indic',
                                                                        'string'
                                                                      ],
                                                              '117' => [
                                                                         'BWAS-Sd8-Programming-Invoke-Time',
                                                                         'string'
                                                                       ],
                                                              '43' => [
                                                                        'BWAS-Type-Of-Network',
                                                                        'string'
                                                                      ],
                                                              '5' => [
                                                                       'BWAS-Group-Number',
                                                                       'string'
                                                                     ],
                                                              '33' => [
                                                                        'BWAS-Department',
                                                                        'string'
                                                                      ],
                                                              '21' => [
                                                                        'BWAS-Network-Translated-Number',
                                                                        'string'
                                                                      ],
                                                              '63' => [
                                                                        'BWAS-Acc-Per-Call-Invoke-Time',
                                                                        'string'
                                                                      ],
                                                              '7' => [
                                                                       'BWAS-Calling-Number',
                                                                       'string'
                                                                     ],
                                                              '26' => [
                                                                        'BWAS-Codec',
                                                                        'string'
                                                                      ],
                                                              '80' => [
                                                                        'BWAS-Cancel-Cwt-Per-Call-Fac-Result',
                                                                        'string'
                                                                      ],
                                                              '119' => [
                                                                         'BWAS-Clear-Mwi-Invoke-Time',
                                                                         'string'
                                                                       ],
                                                              '99' => [
                                                                        'BWAS-Direct-Vm-Xfer-Invoke-Time',
                                                                        'string'
                                                                      ],
                                                              '72' => [
                                                                        'BWAS-Call-Park-Retr-Fac-Result',
                                                                        'string'
                                                                      ],
                                                              '74' => [
                                                                        'BWAS-Call-Pickup-Fac-Result',
                                                                        'string'
                                                                      ],
                                                              '61' => [
                                                                        'BWAS-Charging-Vection-Orig',
                                                                        'string'
                                                                      ],
                                                              '108' => [
                                                                         'BWAS-Sac-Unlock-Fac-Result',
                                                                         'string'
                                                                       ],
                                                              '115' => [
                                                                         'BWAS-Sd100-Programming-Invoke-Time',
                                                                         'string'
                                                                       ],
                                                              '92' => [
                                                                        'BWAS-Cfna-Deact-Fac-Result',
                                                                        'string'
                                                                      ],
                                                              '103' => [
                                                                         'BWAS-Dnd-Deact-Invoke-Time',
                                                                         'string'
                                                                       ],
                                                              '10' => [
                                                                        'BWAS-Start-Time',
                                                                        'string'
                                                                      ],
                                                              '113' => [
                                                                         'BWAS-Return-Call-Invoke-Time',
                                                                         'string'
                                                                       ],
                                                              '91' => [
                                                                        'BWAS-Cfna-Deact-Invoke-Time',
                                                                        'string'
                                                                      ],
                                                              '48' => [
                                                                        'BWAS-Conference-Invoke-Time',
                                                                        'string'
                                                                      ],
                                                              '107' => [
                                                                         'BWAS-Sac-Unlock-Invoke-Time',
                                                                         'string'
                                                                       ],
                                                              '87' => [
                                                                        'BWAS-Cfb-Deact-Invoke-Time',
                                                                        'string'
                                                                      ],
                                                              '77' => [
                                                                        'BWAS-Dpubi-Invoke-Time',
                                                                        'string'
                                                                      ],
                                                              '123' => [
                                                                         'BWAS-Other-Party-Name-Pres-Indic',
                                                                         'string'
                                                                       ],
                                                              '50' => [
                                                                        'BWAS-Conference-To',
                                                                        'string'
                                                                      ],
                                                              '39' => [
                                                                        'BWAS-Redirecting-Number',
                                                                        'string'
                                                                      ],
                                                              '64' => [
                                                                        'BWAS-Acc-Per-Call-Fac-Result',
                                                                        'string'
                                                                      ],
                                                              '97' => [
                                                                        'BWAS-Cot-Invoke-Time',
                                                                        'string'
                                                                      ],
                                                              '12' => [
                                                                        'BWAS-Answer-Indic',
                                                                        'string'
                                                                      ],
                                                              '41' => [
                                                                        'BWAS-Redirecting-Reason',
                                                                        'string'
                                                                      ],
                                                              '52' => [
                                                                        'BWAS-Conference-Id',
                                                                        'string'
                                                                      ],
                                                              '56' => [
                                                                        'BWAS-Conference-Owner-Dn',
                                                                        'string'
                                                                      ],
                                                              '45' => [
                                                                        'BWAS-Local-Callid',
                                                                        'string'
                                                                      ],
                                                              '66' => [
                                                                        'BWAS-Acb-Act-Fac-Result',
                                                                        'string'
                                                                      ],
                                                              '19' => [
                                                                        'BWAS-Call-Category',
                                                                        'string'
                                                                      ],
                                                              '54' => [
                                                                        'BWAS-Conference-Bridge',
                                                                        'string'
                                                                      ],
                                                              '70' => [
                                                                        'BWAS-Call-Park-Fac-Result',
                                                                        'string'
                                                                      ],
                                                              '68' => [
                                                                        'BWAS-Acb-Deact-Fac-Result',
                                                                        'string'
                                                                      ],
                                                              '1' => [
                                                                       'BWAS-Record-id',
                                                                       'string'
                                                                     ],
                                                              '88' => [
                                                                        'BWAS-Cfb-Deact-Fac-Result',
                                                                        'string'
                                                                      ],
                                                              '116' => [
                                                                         'BWAS-Sd100-Programming-Fac-Result',
                                                                         'string'
                                                                       ],
                                                              '30' => [
                                                                        'BWAS-Failover-Correlation-Id',
                                                                        'string'
                                                                      ],
                                                              '100' => [
                                                                         'BWAS-Direct-Vm-Xfer-Fac-Result',
                                                                         'string'
                                                                       ],
                                                              '25' => [
                                                                        'BWAS-Network-Callid',
                                                                        'string'
                                                                      ],
                                                              '128' => [
                                                                         'BWAS-Hoteling-Invoke-Time',
                                                                         'string'
                                                                       ],
                                                              '28' => [
                                                                        'BWAS-Access-Callid',
                                                                        'string'
                                                                      ],
                                                              '120' => [
                                                                         'BWAS-Clear-Mwi-Fac-Result',
                                                                         'string'
                                                                       ],
                                                              '40' => [
                                                                        'BWAS-Redirecting-Presentation-Indic',
                                                                        'string'
                                                                      ],
                                                              '75' => [
                                                                        'BWAS-Directed-Call-Pickup-Invoke-Time',
                                                                        'string'
                                                                      ],
                                                              '83' => [
                                                                        'BWAS-Cfa-Deact-Invoke-Time',
                                                                        'string'
                                                                      ],
                                                              '59' => [
                                                                        'BWAS-Charging-Vector-Key',
                                                                        'string'
                                                                      ],
                                                              '130' => [
                                                                         'BWAS-Hoteling-UserId',
                                                                         'string'
                                                                       ],
                                                              '53' => [
                                                                        'BWAS-Conference-Role',
                                                                        'string'
                                                                      ],
                                                              '122' => [
                                                                         'BWAS-Other-Party-Name',
                                                                         'string'
                                                                       ],
                                                              '42' => [
                                                                        'BWAS-Charge-Indic',
                                                                        'string'
                                                                      ],
                                                              '22' => [
                                                                        'BWAS-Network-Translated-Group',
                                                                        'string'
                                                                      ],
                                                              '46' => [
                                                                        'BWAS-Remote-Callid',
                                                                        'string'
                                                                      ],
                                                              '13' => [
                                                                        'BWAS-Answer-Time',
                                                                        'string'
                                                                      ],
                                                              '105' => [
                                                                         'BWAS-Sac-Lock-Invoke-Time',
                                                                         'string'
                                                                       ],
                                                              '6' => [
                                                                       'BWAS-Direction',
                                                                       'string'
                                                                     ],
                                                              '85' => [
                                                                        'BWAS-Cfb-Act-Invoke-Time',
                                                                        'string'
                                                                      ],
                                                              '36' => [
                                                                        'BWAS-Original-Called-Number',
                                                                        'string'
                                                                      ],
                                                              '3' => [
                                                                       'BWAS-Type',
                                                                       'string'
                                                                     ],
                                                              '94' => [
                                                                        'BWAS-Clid-Delivery-Per-Call-Fac-Result',
                                                                        'string'
                                                                      ],
                                                              '51' => [
                                                                        'BWAS-Conference-From',
                                                                        'string'
                                                                      ],
                                                              '9' => [
                                                                       'BWAS-Called-Number',
                                                                       'string'
                                                                     ],
                                                              '111' => [
                                                                         'BWAS-Last-Number-Redial-Invoke-Time',
                                                                         'string'
                                                                       ],
                                                              '38' => [
                                                                        'BWAS-Original-Called-Reason',
                                                                        'string'
                                                                      ],
                                                              '4' => [
                                                                       'BWAS-User-Number',
                                                                       'string'
                                                                     ],
                                                              '34' => [
                                                                        'BWAS-Account-Code',
                                                                        'string'
                                                                      ],
                                                              '132' => [
                                                                         'BWAS-Hoteling-Group-Number',
                                                                         'string'
                                                                       ]
                                                            }
                                                },
                                   'rval' => {
                                               '40' => {
                                                         '1' => 'Start'
                                                       }
                                             },
                                   'vsaval' => {}
                                 }, 'Net::Radius::Dictionary' ),
          'opts' => {
                      'identifier' => 89,
                      'authenticator' => '~���D�ެc@���',
                      'dictionary' => [
                                        './minidict'
                                      ],
                      'secret' => '',
                      'description' => 'BroadSoft Acct-Req (Contributed by j7)',
                      'slots' => 3,
                      'output' => '../packets/broadsoft-areq-00.p'
                    },
          'slots' => 3
        };
