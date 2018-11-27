<dsp:page>
<dsp:getvalueof var="PAGE_TYPE" param="PAGE_TYPE"/>
				<c:choose>
				<c:when test="${PAGE_TYPE eq 'PHONE'}">
					<section  id="legal" class="phones-legal">
				  		<!-- Legal -->
						<div class="wrapper row">	
						  <div class="large-12 small-12 columns large-centered small-centered">
						   <h4>LEGAL:</h4>
						   <crs:outMessage key="cricket_allPhones_legal" />
						   <!-- <p>Availability of features vary. All third-party products, services and/or trademarks are property of their respective owners and are not endorsements of Cricket services. Android&trade; is a trademark of Google, Inc. The Android Robot is reproduced or modified from work created and shared by Google for use according to terms described in the Creative Common 3.0 Attribution License. BlackBerry is a registered trademark of Research in Motion Limited and is registered and/or used in the U.S. and countries around the world. Samsung, Vitality and Chrono are all trademarks of Samsung Electronics America, Inc. and/or its related entities.</p><p>Rate plans contain a full speed data allowance. Once you reach your full speed data allowance your speeds will be reduced. See <a href="http://mycricket.com/fairuse">mycricket.com/fairuse</a> for details. Terms, conditions, and other restrictions apply. We may limit or terminate your service without prior notice for excessive use of partner network or if you no longer have a valid address in a Cricket owned network area. Exclude sales tax. Terms, conditions &amp; other restrictions apply. &copy; 2012 Cricket Communications, Inc. &trade; &amp; &copy; 2012 Apple Inc. All rights reserved.</p> -->
						  </div>
						</div>
					</section>
				</c:when>
				<c:when test="${PAGE_TYPE eq 'ACCESSORY'}">
					<section class="phones-legal">
				  		<!-- Legal -->
						<div class="wrapper row">	
						  <div class="large-12 small-12 columns large-centered small-centered">
						   <h4>LEGAL:</h4>
						   <crs:outMessage key="cricket_accessories_legal" />
						   <!-- <p>Availability of features vary. All third-party products, services and/or trademarks are property of their respective owners and are not endorsements of Cricket services. Android&trade; is a trademark of Google, Inc. The Android Robot is reproduced or modified from work created and shared by Google for use according to terms described in the Creative Common 3.0 Attribution License. BlackBerry is a registered trademark of Research in Motion Limited and is registered and/or used in the U.S. and countries around the world. Samsung, Vitality and Chrono are all trademarks of Samsung Electronics America, Inc. and/or its related entities.</p><p>Rate plans contain a full speed data allowance. Once you reach your full speed data allowance your speeds will be reduced. See <a href="http://mycricket.com/fairuse">mycricket.com/fairuse</a> for details. Terms, conditions, and other restrictions apply. We may limit or terminate your service without prior notice for excessive use of partner network or if you no longer have a valid address in a Cricket owned network area. Exclude sales tax. Terms, conditions &amp; other restrictions apply. &copy; 2012 Cricket Communications, Inc. &trade; &amp; &copy; 2012 Apple Inc. All rights reserved.</p> -->
						  </div>
						</div>
					</section>
				</c:when>
				<c:when test="${PAGE_TYPE eq 'PLAN'}">
					<div class="row section-legal">
								<!-- Commenting out Terms of use for 8251 -->
								<h4><!-- Terms of Use: --></h4>
								<div data-options="one_up: false" data-section="tabs" class="section-container tabs" id="section-container-legal" style="">
								  <section id="hidden" class="active" style="padding-top: 0px;">
								   <p data-section-title="" class="title" style="left: 0px;"><a href="#panelhidden"></a></p>
								   <div data-section-content="" class="content"></div>
								  </section>
									<section>
										<p data-section-title="" class="title" style="left: 0px;"><a href="#panel1">General Terms</a></p>
										<div data-section-content="" class="content">
											<crs:outMessage key="cricket_allPlans_generalTerms" />
											<!-- <p><strong>General Terms:</strong> We reserve the right to cancel offers early or extend offers without notice. Offers may not be available everywhere or combinable with other promotions/options. Coverage is not available everywhere and varies by service - see mapping brochures or visit our official website (<a target="_blank" href="http://www.mycricket.com">www.mycricket.com</a>) for details. Our services may only work with our phones - not all services are available with all phones, on all networks or within all coverage areas. Monthly service charges are non-refundable even if service is terminated or modified before your billing cycle ends. International roaming rates for voice and data services are additional and will vary. On calls that cross time periods, minutes are generally deducted or charged based on the call start time. Partial minutes of use are rounded up to the next whole minute.</p>
											<p><strong>Nature of our Service:</strong> Our rate plans, devices, services and features are not for resale and are intended for reasonable and non-continuous use by a person using a device on Cricket's networks.</p>
											<p>Availability of features vary. All third-party products, services and/or trademarks are property of their respective owners and are not endorsements of Cricket services. Android&trade; is a trademark of Google, Inc. The Android Robot is reproduced or modified from work created and shared by Google for use according to terms described in the Creative Common 3.0 Attribution License. BlackBerry is a registered trademark of Research In Motion Limited and is registered and/or used in the U.S. and countries around the world. Samsung, Vitality and Chrono are all trademarks of Samsung Electronics America, Inc. and/or its related entities.</p>
											<p>Rate plans contain a full speed data allowance. Once you reach your full speed data allowance your speeds will be reduced. See <a target="_blank" href="http://mycricket.com/fairuse">mycricket.com/fairuse</a> for details. Terms, conditions and other restrictions apply. We may limit or terminate your service without prior notice for excessive use of partner network or if you no longer have a valid address in a Cricket owned network area. Excludes sales tax. Terms, conditions &amp; other restrictions apply. &copy; 2013 Cricket Communications, Inc. TM &amp; &copy; 2013 Apple Inc. All rights reserved.</p> -->						
										</div>
									</section>
									<section>
										<p data-section-title="" class="title" style="left: 100px;"><a href="#panel2">Prohibited Network Usage</a></p>
										<div data-section-content="" class="content">
											<crs:outMessage key="cricket_allPlans_prohibitedNetworkUsage" />
											<!-- <p><strong>Prohibited Network Uses:</strong> To ensure the activities of some users do not impair the ability of our customers to have access to reliable services provided at reasonable costs, you may not use our services in a manner that is unlawful, infringes on intellectual property rights, or harms or unduly interferes with the use of Cricket's network or systems. Cricket reserves the right, without notice or limitation, to limit data throughput speeds or quantities or to deny, terminate, end, modify, disconnect, or suspend service if an individual engages in any of the prohibited voice or data uses set forth in the Agreement, <a target="_blank" href="#">Fair Use Policy</a>, <a target="_blank" href="#">Acceptable Use Policy</a>, detailed below or if Cricket, in its sole discretion, determines action is necessary to protect its wireless networks from harm or degradation.</p> 
											<p><strong>Examples of prohibited voice uses:</strong> Cricket voice services are provided solely for live dialogue between, and initiated by, individuals for personal use and as otherwise described in this policy. Cricket services may not be used for any other purposes, including, but not limited to: monitoring services, transmission of broadcasts, transmission of recorded material, telemarketing, autodialed calls, other commercial uses, or other connections that do not consist of uninterrupted live dialogue between individuals.</p> 
											<p><strong>Examples of prohibited data uses:</strong> Cricket data services are provided solely for purposes of web surfing, sending and receiving email, photographs and other similar messaging activities, and the non-continuous streaming of videos, downloading of files or on-line gaming. Our data services may not be used: (i) to generate excessive amounts of Internet traffic through the continuous, unattended streaming, downloading or uploading of videos or other files or to operate hosting services including, but not limited to, web or gaming hosting; (ii) to maintain continuous active network connections to the Internet such as through a web camera or machine-to-machine connections that do not involve active participation by a person; (iii) to disrupt email use by others using automated or manual routines, including, but not limited to "auto-responders" or cancel bots or other similar routines; (iv) to transmit or facilitate any unsolicited or unauthorized advertising, telemarketing, promotional materials, "junk mail", unsolicited commercial or bulk email, or fax; (v) for activities adversely affecting the ability of other people or systems to use either Cricket's wireless services or other parties' Internet-based resources, including, but not limited to, "denial of service" (DoS) attacks against another network host or individual user; (vi) for an activity that connects any device to Personal Computers (including without limitation, laptops), or other equipment for the purpose of transmitting wireless data over the network (unless customer is using a plan designated for such usage); or (vi) for any other reason that, in our sole discretion violates our policy of providing service for individual use.</p> 
											<p><strong>Unlimited Use Plans:</strong> If you subscribe to rate plans, services or features that are described as unlimited, you should be aware that such "unlimited" plans are subject to these Cricket Prohibited Network Uses. Rate plans also contain a data usage level. Once you reach your usage level your speeds will be reduced for the remainder of your bill cycle.</p>
											<p>Availability of features vary. All third-party products, services and/or trademarks are property of their respective owners and are not endorsements of Cricket services. Android&trade; is a trademark of Google, Inc. The Android Robot is reproduced or modified from work created and shared by Google for use according to terms described in the Creative Common 3.0 Attribution License. BlackBerry is a registered trademark of Research In Motion Limited and is registered and/or used in the U.S. and countries around the world. Samsung, Vitality and Chrono are all trademarks of Samsung Electronics America, Inc. and/or its related entities.</p>
											<p>Rate plans contain a full speed data allowance. Once you reach your full speed data allowance your speeds will be reduced. See <a target="_blank" href="http://mycricket.com/fairuse">mycricket.com/fairuse</a> for details. Terms, conditions and other restrictions apply. We may limit or terminate your service without prior notice for excessive use of partner network or if you no longer have a valid address in a Cricket owned network area. Excludes sales tax. Terms, conditions &amp; other restrictions apply. &copy; 2013 Cricket Communications, Inc. TM &amp; &copy; 2013 Apple Inc. All rights reserved.</p> -->
										</div>
										</section>
									<section>
										<p data-section-title="" class="title" style="left: 266px;"><a href="#panel2">Messaging (text, picture and video)</a></p>
										<div data-section-content="" class="content">
											<crs:outMessage key="cricket_allPlans_messaging" />
											<!-- <p><strong>Messaging (text, picture and video):</strong> Certain messages, including those to third parties to participate in a promotion or other program, will result in additional charges. International messaging rates may vary and are subject to change. There is no guarantee that messages will be received, and we are not responsible for lost or misdirected messages. Most text messages are limited to 160 characters.</p>
											<p><strong>International Long Distance and Messaging:</strong> Rates and available countries are available at <a target="_blank" href="#">www.mycricket.com</a>. International rates are subject to change without notice.</p>
											<p>Availability of features vary. All third-party products, services and/or trademarks are property of their respective owners and are not endorsements of Cricket services. Android&trade; is a trademark of Google, Inc. The Android Robot is reproduced or modified from work created and shared by Google for use according to terms described in the Creative Common 3.0 Attribution License. BlackBerry is a registered trademark of Research In Motion Limited and is registered and/or used in the U.S. and countries around the world. Samsung, Vitality and Chrono are all trademarks of Samsung Electronics America, Inc. and/or its related entities.</p>
											<p>Rate plans contain a full speed data allowance. Once you reach your full speed data allowance your speeds will be reduced. See <a target="_blank" href="http://mycricket.com/fairuse">mycricket.com/fairuse</a> for details. Terms, conditions and other restrictions apply. We may limit or terminate your service without prior notice for excessive use of partner network or if you no longer have a valid address in a Cricket owned network area. Excludes sales tax. Terms, conditions &amp; other restrictions apply. &copy; 2013 Cricket Communications, Inc. TM &amp; &copy; 2013 Apple Inc. All rights reserved.</p> -->
										</div>
									</section>
									<section>
										<p data-section-title="" class="title" style="left: 483px;"><a href="#panel2">GPS/Location Based Services</a></p>
										<div data-section-content="" class="content">
											<crs:outMessage key="cricket_allPlans_locationBasedServices" />
											<!-- <p><strong>GPS /Location Based Services:</strong> Environment may limit GPS/ location based service information. It is the responsibility of the Account holder to notify device users that location can be identified while using GPS / location based service applications.</p>
											<p>Availability of features vary. All third-party products, services and/or trademarks are property of their respective owners and are not endorsements of Cricket services. Android&trade; is a trademark of Google, Inc. The Android Robot is reproduced or modified from work created and shared by Google for use according to terms described in the Creative Common 3.0 Attribution License. BlackBerry is a registered trademark of Research In Motion Limited and is registered and/or used in the U.S. and countries around the world. Samsung, Vitality and Chrono are all trademarks of Samsung Electronics America, Inc. and/or its related entities.</p>
											<p>Rate plans contain a full speed data allowance. Once you reach your full speed data allowance your speeds will be reduced. See <a target="_blank" href="http://mycricket.com/fairuse">mycricket.com/fairuse</a> for details. Terms, conditions and other restrictions apply. We may limit or terminate your service without prior notice for excessive use of partner network or if you no longer have a valid address in a Cricket owned network area. Excludes sales tax. Terms, conditions &amp; other restrictions apply. &copy; 2013 Cricket Communications, Inc. TM &amp; &copy; 2013 Apple Inc. All rights reserved.</p> -->
										</div>
									</section>
									<section>
										<p data-section-title="" class="title" style="left: 664px;"><a href="#panel2">Data</a></p>
										<div data-section-content="" class="content">
											<crs:outMessage key="cricket_allPlans_data" />
											<!-- <p><strong>Data:</strong> Services are not available with all Cricket phones. The amount of data transmitted over our network is measured in kilobytes (KB), megabytes (MB) or gigabytes (GB). Unless specified otherwise 1024KB equals 1MB. 1024MB equal 1GB. Usage is calculated on a per kilobyte, megabyte or gigabyte (depending on your rate plan) basis and is rounded up to the next whole kilobyte, megabyte or gigabyte. Rounding occurs at the end of each session or each clock hour and at which time we deduct accumulated usage from your plan. You are responsible for all data activity from and to your device, regardless of who initiates the activity. Estimates of data usage will vary from actual use. Your bill will not separately identify the number of kilobytes, megabytes or gigabytes attributable to your use of specific sites, sessions or services used. Premium content (games, ringtones, songs, etc.) priced separately. Services are not available for use in connection with server devices or host computer applications, other systems that drive continuous heavy traffic or data sessions, or as substitutes for private lines or frame relay connections. Except with phone-as-modem rate plan or feature, you may not use a phone (including a Bluetooth phone) as a modem in connection with a computer, PDA, or similar device. We reserve the right to deny or terminate service without notice for any misuse or any use that adversely affects network performance.</p>
											<p><strong>Web Access:</strong> Cricket can help you prevent the transmission of material harmful to minors on certain devices by allowing access to a limited number of Internet web sites or restricting Web access.</p>
											<p>For additional information, refer to the <a target="_blank" href="#">Fair Use Policy</a>.</p>
											<p>Availability of features vary. All third-party products, services and/or trademarks are property of their respective owners and are not endorsements of Cricket services. Android&trade; is a trademark of Google, Inc. The Android Robot is reproduced or modified from work created and shared by Google for use according to terms described in the Creative Common 3.0 Attribution License. BlackBerry is a registered trademark of Research In Motion Limited and is registered and/or used in the U.S. and countries around the world. Samsung, Vitality and Chrono are all trademarks of Samsung Electronics America, Inc. and/or its related entities.</p>
											<p>Rate plans contain a full speed data allowance. Once you reach your full speed data allowance your speeds will be reduced. See <a target="_blank" href="http://mycricket.com/fairuse">mycricket.com/fairuse</a> for details. Terms, conditions and other restrictions apply. We may limit or terminate your service without prior notice for excessive use of partner network or if you no longer have a valid address in a Cricket owned network area. Excludes sales tax. Terms, conditions &amp; other restrictions apply. &copy; 2013 Cricket Communications, Inc. TM &amp; &copy; 2013 Apple Inc. All rights reserved.</p> -->
										</div>
									</section>
									<section>
										<p data-section-title="" class="title" style="left: 706px;"><a href="#panel2">Off-Network Usage</a></p>
										<div data-section-content="" class="content">
											<crs:outMessage key="cricket_allPlans_oofNetworkUsage" />
											<!-- <p><strong>Off-Network Usage:</strong> The primary use of your Device must be for domestic purposes within the Cricket-owned network. Cricket reserves the right, without notice, to deny, terminate, modify, disconnect or suspend service if more than 50% of your voice and/or data usage in on a Partner network. The display on your device may not always be on and will not indicate whether you are on a Partner network or roaming. You can monitor usage by calling 800-Cricket and online through MyAccount for certain rate plans. Cricket may limit or terminate service if you no longer live and have a mailing address within a Cricket owned-network area.</p>
											<p>Roaming/Partner Coverage: Data services and certain calling features (Voicemail, Caller ID, Call Waiting, etc.) may not be available in all areas. Cricket reserves the right to deny, terminate, modify, disconnect or suspend service if the majority of minutes or kilobytes are used while roaming or on a Partner network.</p>
											<p>Availability of features vary. All third-party products, services and/or trademarks are property of their respective owners and are not endorsements of Cricket services. Android&trade; is a trademark of Google, Inc. The Android Robot is reproduced or modified from work created and shared by Google for use according to terms described in the Creative Common 3.0 Attribution License. BlackBerry is a registered trademark of Research In Motion Limited and is registered and/or used in the U.S. and countries around the world. Samsung, Vitality and Chrono are all trademarks of Samsung Electronics America, Inc. and/or its related entities.</p>
											<p>Rate plans contain a full speed data allowance. Once you reach your full speed data allowance your speeds will be reduced. See <a target="_blank" href="http://mycricket.com/fairuse">mycricket.com/fairuse</a> for details. Terms, conditions and other restrictions apply. We may limit or terminate your service without prior notice for excessive use of partner network or if you no longer have a valid address in a Cricket owned network area. Excludes sales tax. Terms, conditions &amp; other restrictions apply. &copy; 2013 Cricket Communications, Inc. TM &amp; &copy; 2013 Apple Inc. All rights reserved.</p> --> 
										</div>
									</section>
								</div>
							</div>
				</c:when>				
				<c:otherwise>
				</c:otherwise>
			</c:choose>


	
</dsp:page>