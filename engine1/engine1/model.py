from django.db import models
import datetime

class firData(models.Model):
    fir_number = models.CharField(max_length=255)
    state = models.CharField(max_length=255)
    district = models.CharField(max_length=255)
    police_station = models.CharField(max_length=255)
    incident_date = models.DateField(default=datetime.date.today)
    incident_time = models.TimeField(auto_now_add=True)
    complainant_name = models.CharField(max_length=255)
    complainant_address = models.TextField()
    complainant_mobile_number = models.CharField(max_length=10)
    accused_name = models.CharField(max_length=255)
    accused_address = models.TextField()
    offense_detail = models.TextField()
    offense_date = models.DateField(default=datetime.date.today)
    witness_detail = models.TextField()
    investigating_officer = models.CharField(max_length=255)
    current_status = models.CharField(max_length=255)
    reporting_date = models.DateField(default=datetime.date.today)
    reporting_time = models.TimeField(auto_now_add=True)
    remarks = models.TextField()

    class Meta:
        db_table = 'FIR.\"firData\"'
