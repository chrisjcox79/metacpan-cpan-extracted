package Microsoft::AdCenter::V7::CampaignManagementService::BudgetLimitType;
# Copyright (C) 2012 Xerxes Tsang
# This program is free software; you can redistribute it and/or modify it
# under the terms of Perl Artistic License.

use strict;
use warnings;

=head1 NAME

Microsoft::AdCenter::V7::CampaignManagementService::BudgetLimitType - Represents "BudgetLimitType" in Microsoft AdCenter Campaign Management Service.

=head1 SYNOPSIS

See L<http://msdn.microsoft.com/en-us/library/ee730327.aspx> for documentation of the various data objects.

=head1 ENUMERATION VALUES

    DailyBudgetWithMaximumMonthlySpend
    MonthlyBudgetDivideDailyAcrossMonth
    MonthlyBudgetSpendUntilDepleted

=cut

sub DailyBudgetWithMaximumMonthlySpend {
    return 'DailyBudgetWithMaximumMonthlySpend';
}

sub MonthlyBudgetDivideDailyAcrossMonth {
    return 'MonthlyBudgetDivideDailyAcrossMonth';
}

sub MonthlyBudgetSpendUntilDepleted {
    return 'MonthlyBudgetSpendUntilDepleted';
}

1;
