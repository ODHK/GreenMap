#!/usr/bin/perl
use strict;
use warnings;
use Text::CSV;


my $header = '<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
  <Document>
    <name>KmlFile</name>
    <Style id="dispose_company_plastic">
    <IconStyle>
        <Icon>
          <href>https://dl.dropboxusercontent.com/u/14106269/earthmap_icons/plastic_60.png
          </href>
        </Icon>
      </IconStyle>
      <BalloonStyle>
        <text>
            $[info]
        </text>
      </BalloonStyle>
    </Style>
    <Style id="dispose_org_food">
    <IconStyle>
        <Icon>
          <href>https://dl.dropboxusercontent.com/u/14106269/earthmap_icons/food_60.png
          </href>
        </Icon>
      </IconStyle>
      <BalloonStyle>
        <text>
            $[info]
        </text>
      </BalloonStyle>
    </Style>
    <Style id="dispose_org_furniture">
    <IconStyle>
        <Icon>
          <href>https://dl.dropboxusercontent.com/u/14106269/earthmap_icons/furniture_60.png
          </href>
        </Icon>
      </IconStyle>
      <BalloonStyle>
        <text>
            $[info]
        </text>
      </BalloonStyle>
    </Style>
    <Style id="dispose_org_elec">
    <IconStyle>
        <Icon>
          <href>https://dl.dropboxusercontent.com/u/14106269/earthmap_icons/electronic_60.png
          </href>
        </Icon>
      </IconStyle>
      <BalloonStyle>
        <text>
            $[info]
        </text>
      </BalloonStyle>
    </Style>
    <Style id="dispose_org_clothing">
    <IconStyle>
        <Icon>
          <href>https://dl.dropboxusercontent.com/u/14106269/earthmap_icons/event_60.png
          </href>
        </Icon>
      </IconStyle>
      <BalloonStyle>
        <text>
            $[info]
        </text>
      </BalloonStyle>
    </Style>
    <Style id="get_clothing">
    <IconStyle>
        <Icon>
          <href>https://dl.dropboxusercontent.com/u/14106269/earthmap_icons/event_60.png
          </href>
        </Icon>
      </IconStyle>
      <BalloonStyle>
        <text>
            $[info]
        </text>
      </BalloonStyle>
    </Style>
    <Style id="dispose_org_books">
    <IconStyle>
        <Icon>
          <href>https://dl.dropboxusercontent.com/u/14106269/earthmap_icons/book_60.png
          </href>
        </Icon>
      </IconStyle>
      <BalloonStyle>
        <text>
            $[info]
        </text>
      </BalloonStyle>
    </Style>
    <Style id="get_books">
    <IconStyle>
        <Icon>
          <href>https://dl.dropboxusercontent.com/u/14106269/earthmap_icons/book_60.png
          </href>
        </Icon>
      </IconStyle>
      <BalloonStyle>
        <text>
            $[info]
        </text>
      </BalloonStyle>
    </Style>
    <Style id="dispose_company_glass">
    <IconStyle>
        <Icon>
          <href>https://dl.dropboxusercontent.com/u/14106269/earthmap_icons/glass_60.png
          </href>
        </Icon>
      </IconStyle>
      <BalloonStyle>
        <text>
            $[info]
        </text>
      </BalloonStyle>
    </Style>
    <Style id="dispose_org_glass">
    <IconStyle>
        <Icon>
          <href>https://dl.dropboxusercontent.com/u/14106269/earthmap_icons/glass_60.png
          </href>
        </Icon>
      </IconStyle>
      <BalloonStyle>
        <text>
            $[info]
        </text>
      </BalloonStyle>
    </Style>
    <Style id="dispose_bin_clothing">
    <IconStyle>
        <Icon>
          <href>https://dl.dropboxusercontent.com/u/14106269/earthmap_icons/clothes_60.png
          </href>
        </Icon>
      </IconStyle>
      <BalloonStyle>
        <text>
            $[info]
        </text>
      </BalloonStyle>
    </Style>
    <Style id="dispose_bin_paper">
    <IconStyle>
        <Icon>
          <href>https://dl.dropboxusercontent.com/u/14106269/earthmap_icons/paper_60.png
          </href>
        </Icon>
      </IconStyle>
      <BalloonStyle>
        <text>
            $[info]
        </text>
      </BalloonStyle>
    </Style>
    <Style id="dispose_bin_metal">
    <IconStyle>
        <Icon>
          <href>https://dl.dropboxusercontent.com/u/14106269/earthmap_icons/metal_60.png
          </href>
        </Icon>
      </IconStyle>
      <BalloonStyle>
        <text>
            $[info]
        </text>
      </BalloonStyle>
    </Style>
    <Style id="dispose_bin_plastic">
    <IconStyle>
        <Icon>
          <href>https://dl.dropboxusercontent.com/u/14106269/earthmap_icons/plastic_60.png
          </href>
        </Icon>
      </IconStyle>
      <BalloonStyle>
        <text>
            $[info]
        </text>
      </BalloonStyle>
    </Style>



';
my $footer = '
  </Document>
</kml>
';

my $body = '';

my $file = 'greenmaphk.csv';
my $csv = Text::CSV->new();

open (CSV, "<", $file) or die $!;

print $header;

while (<CSV>) {
    if ($csv->parse($_)) {
        my @columns = $csv->fields();
	print "
    <Placemark>
      <name>$columns[0]</name>
      <styleUrl>#$columns[4]</styleUrl>
      <ExtendedData>
        <Data name=\"info\">
          <value>
            <![CDATA[$columns[7]]]> 
          </value>
        </Data>
      </ExtendedData>
      <Point>
        <coordinates>$columns[6],$columns[5]</coordinates>
      </Point>
    </Placemark>
        ";
    } else {
        my $err = $csv->error_input;
        print "Failed to parse line: $err";
    }
}
close CSV;

print $footer;
