<%@ Page Title="Terms of Service | Primeonx" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="terms-of-service.aspx.cs" Inherits="primeonx_global.terms_of_service" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <asp:Literal ID="litHreflang" runat="server" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="rts-service-details-breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-area">
                        <ul>
                            <li>
                                <a href="<%: ((primeonx_global.SiteMaster)Master).L("") %>">
                                    <%: T("Home","Ana Sayfa") %>
                                </a>
                            </li>
                            <li><i class="fa fa-chevron-right"></i></li>
                            <li><a href="#" class="active"><%: T("Terms of Service","Hizmet Şartları") %></a></li>
                        </ul>

                        <h1 class="title rts-text-anime-style-1"><%: T("Terms of Service","Hizmet Şartları") %></h1>

                        <p class="disc mt--20">
                            <%: T(
                                "These Terms of Service govern your use of the Primeonx website and any engagement initiated through our site.",
                                "Bu Hizmet Şartları, Primeonx web sitesini kullanımınızı ve sitemiz üzerinden başlatılan çalışmaları düzenler."
                            ) %>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="rts-faq-area-start rts-section-gapBottom">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="accordon-pricing-wrapper-three full-width">

                        <div class="mb--30">
                            <p class="disc">
                                <strong>Effective date:</strong> January 01, 2026
                                <span class="ms-3"></span>
                                <strong>Last updated:</strong> February 14, 2026
                            </p>
                        </div>

                        <div class="rts-terms-article">

                            <h3 class="title">1. Acceptance of Terms</h3>
                            <p class="disc">
                                By accessing or using this website, you agree to be bound by these Terms of Service and our Privacy Policy.
                                If you do not agree, do not use the website.
                            </p>

                            <h3 class="title">2. Services and Engagements</h3>
                            <p class="disc">
                                Primeonx provides digital engineering services, which may include website development, technical SEO,
                                automation systems, integrations, and related consulting. Any deliverables, timelines, pricing, and scope
                                are defined in a written proposal, statement of work, or signed agreement (“SOW”). If there is a conflict
                                between these Terms and an SOW, the SOW controls for that engagement.
                            </p>

                            <h3 class="title">3. No Professional Advice</h3>
                            <p class="disc">
                                Content on this website is provided for general informational purposes and does not constitute legal,
                                financial, or professional advice. You are responsible for determining whether any service or recommendation
                                is appropriate for your situation.
                            </p>

                            <h3 class="title">4. Intellectual Property</h3>
                            <p class="disc">
                                The website, branding, logos, text, and original content are owned by Primeonx or its licensors and are
                                protected by applicable intellectual property laws. You may not copy, reproduce, distribute, or create
                                derivative works from this content without prior written permission.
                            </p>
                            <p class="disc">
                                For client work, ownership and licensing of deliverables will be defined in the applicable SOW. Unless
                                otherwise agreed in writing, Primeonx retains ownership of pre-existing materials, tools, templates, and
                                know-how used to deliver the services.
                            </p>

                            <h3 class="title">5. Client Responsibilities</h3>
                            <p class="disc">
                                If you engage Primeonx, you agree to provide timely access to required systems, content, approvals, and
                                accurate information needed to perform the work. Delays caused by missing information, delayed approvals,
                                or inaccessible systems may impact timelines.
                            </p>

                            <h3 class="title">6. Payments, Fees, and Refunds</h3>
                            <p class="disc">
                                Fees, payment schedules, and billing terms are defined in the SOW or invoice. Unless otherwise stated,
                                invoices are due upon receipt. Late payments may pause work and may be subject to reasonable collection
                                efforts as permitted by law.
                            </p>
                            <p class="disc">
                                Due to the nature of custom engineering work, refunds are not guaranteed. Any refund terms must be stated
                                explicitly in the SOW.
                            </p>

                            <h3 class="title">7. Disclaimers</h3>
                            <p class="disc">
                                The website and services are provided “as is” and “as available.” To the maximum extent permitted by law,
                                Primeonx disclaims all warranties, express or implied, including implied warranties of merchantability,
                                fitness for a particular purpose, and non-infringement.
                            </p>
                            <p class="disc">
                                Primeonx does not guarantee specific outcomes such as search rankings, revenue increases, lead volume,
                                or performance improvements, as results depend on many external factors outside our control.
                            </p>

                            <h3 class="title">8. Limitation of Liability</h3>
                            <p class="disc">
                                To the maximum extent permitted by law, Primeonx will not be liable for any indirect, incidental,
                                special, consequential, or punitive damages, including lost profits, lost data, business interruption,
                                or reputational harm arising from the use of the website or services.
                            </p>
                            <p class="disc">
                                Where liability cannot be excluded, Primeonx’s total liability for any claim will not exceed the amount
                                paid by you to Primeonx for the specific services giving rise to the claim during the three (3) months
                                preceding the event.
                            </p>

                            <h3 class="title">9. Third-Party Links and Tools</h3>
                            <p class="disc">
                                This website may include links to third-party websites or tools. Primeonx is not responsible for third-party
                                content, privacy practices, or availability. Use of third-party services is at your own risk and subject to
                                their terms.
                            </p>

                            <h3 class="title">10. Confidentiality</h3>
                            <p class="disc">
                                During an engagement, both parties may share confidential information. Unless otherwise agreed in writing,
                                each party will use reasonable care to protect the other’s confidential information and use it only for the
                                purpose of providing or receiving services.
                            </p>

                            <h3 class="title">11. Termination</h3>
                            <p class="disc">
                                Primeonx may suspend or terminate website access if misuse is detected. For service engagements, termination
                                terms (including notice periods and payment obligations) will be defined in the SOW. Upon termination, any
                                outstanding fees for work performed remain payable.
                            </p>

                            <h3 class="title">12. Governing Law</h3>
                            <p class="disc">
                                These Terms are governed by applicable laws as defined in the relevant agreement or, if not specified,
                                by the laws of the jurisdiction where Primeonx is established. Venue and dispute resolution details may be
                                included in the SOW for client engagements.
                            </p>

                            <h3 class="title">13. Changes to These Terms</h3>
                            <p class="disc">
                                We may update these Terms from time to time. Updates will be posted on this page with a revised “Last updated” date.
                                Continued use of the website after changes become effective constitutes acceptance of the updated Terms.
                            </p>

                            <h3 class="title">14. Contact</h3>
                            <p class="disc">
                                For questions about these Terms, please contact us via the contact page on this website.
                            </p>

                            <div class="mt--30">
                                <a href="<%: ((primeonx_global.SiteMaster)Master).L("contact") %>" class="rts-btn btn-primary">
                                    <%: T("Contact","İletişim") %>
                                </a>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>