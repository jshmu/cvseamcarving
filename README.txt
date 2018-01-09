{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf100
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 For seam carving an image, use the carv.m file. This uses genEngMap.m to generate an energy map for the input image. cumMinEngHor.m and cumMinEngVer.m determine the vertical and horizontal seam with the least cumulative energy. Depending on whether cumMinEngHor.m or cumMinEngVer.m yields a lower energy, rmHorSeam.m or rmVerSeam.m is used to remove the appropriate row/column of the image.}