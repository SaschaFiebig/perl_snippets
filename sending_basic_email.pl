#!/bin/env perl 

use strict; 
use warnings;
use diagnostics;

# imports
use Email::Sender::Simple qw(sendmail);
use Email::Sender::Transport::SMTPS;
use Try::Tiny;
use Email::Simple::Creator;

# features
use feature 'say';

# Note: To be able sending email via gmail, you have to first enable your gmail account to allow this


# (Deprecated!) https://metacpan.org/pod/Email::Sender::Transport::SMTP::TLS (Deprecated!)
# https://metacpan.org/pod/Email::Sender::Transport::SMTP
# https://github.com/fayland/perl-Email-Sender-Transport-SMTPS

# Note on SMTP Server Addresses (https://clean.email/blog/email-settings)
# =======================================================================
#
# Ports: 465 ssl/tls, 587 tls/starttls
#
# PROVIDER     URL              SMTP HOST
# ========     ===              =========
# Gmail        gmail.com        smtp.gmail.com
# Gmx          gmx.net          mail.gmx.net
# Mail.Ru      mail.ru          smtp.mail.ru
# Yahoo        yahoo.com        smtp.mail.yahoo.com
# Posteo       posteo.de        posteo.de
# Proton       protonmail.com   -
# Outlook.com  outlook.com      smtp.live.com
#                                 -> smtp.office365.com
#                                 -> smtp-mail.outlook.com
# 1&1          1and1.com        smtp.1and1.com
# Airmail      airmail.net      mail.airmail.net
# AOL          aol.com          smtp.aol.com
# AT&T         att.net          outbound.att.net
# Bluewin      bluewin.ch       smtpauths.bluewin.ch
# BT Connect   btconnect.com    mail.btconnect.tom
# Comcast      comcast.net      smtp.comcast.net
# Earthlink    earthlink.net    smtpauth.earthlink.net
# HotPop       hotpop.com       mail.hotpop.com
# Libero       libero.it        mail.libero.it
# Lycos        lycos.com        smtp.lycos.com
# O2           o2.com           smtp.o2.com
# Orange       orange.net       smtp.orange.net
# Tin          tin.it           mail.tin.it
# Tiscali      tiscali.co.uk    smtp.tiscali.co.uk
# Verizon      verizon.net      outgoing.verizon.net
# Virgin       virgin.net       smtp.virgin.net
# Wanadoo      wanadoo.fr       smtp.wanadoo.fr


# email sender settings
my $transport = Email::Sender::Transport::SMTPS->new(
    host          => 'mail.gmx.net', # email service provider smtp domain
    ssl           => 'starttls',
    sasl_username => '',             # your sender address
    sasl_password => '',             # your password
debug    => 0,
);

# put your message body between the first and second "END"
my $email_body = <<END; # delimiter

Hi there,

Please write your email here between the two delimiters
so you are able to write multiple lines of text for
your email.



Kind regards

--
Your Hero

END

# create email header and body
my $message = Email::Simple->create(
    header => [
        From    => '', # email sender address
        To      => '', # email receiver address
        Subject => 'Stuff and things', # email subject
    ],
    body => $email_body,
);

# send the mail
try {
    sendmail($message, { transport => $transport });
    say "Sending Successfull";
} catch {
    die "Error sending email: $_";
};





