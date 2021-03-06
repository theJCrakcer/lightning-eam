# Do not change these lists!!!
Lists.Resources.Roles = {
  5: 'Global Admin'
  4: 'Administrator'
  3: 'Super User'
  2: 'Standard User'
  1: 'Express User'
  0: 'Request User'
}
Lists.Workorders.Types = {
  'workorder': 'Work Order'
  'capital': 'Capital Work Order'
  'pm': 'PM Work Order'
}
Lists.Workorders.Status = {
  0: 'Request Cancelled'
  1: 'Request Started'
  2: 'Request Returned'
  3: 'Request Accepted'
  4: 'Work Order Created'
  5: 'Work Order Approved'
  6: 'Work Order Planned'
  7: 'Work Order Scheduled'
  8: 'Work Order In Progress'
  9: 'Work Order Completed'
  10: 'Work Order Financials'
  11: 'Work Order Reviewed'
  12: 'Work Order Closed'
}

Lists.PM.IntervalUnits = {
  0: 'Days'
  1: 'Weeks'
  2: 'Months'
  3: 'Years'
}

Lists.PM.IntervalTypes = {
  0: 'Calendar'
  1: 'Meter Reading'
}

Lists.PM.CronType = {
  0: 'GUI'
  1: 'Cron'
}

Lists.PM.CronGUI = {
  0: {
    text: 'Daily'
    startTime: true
    startDay: false
    periodDay: false
    startMonth: false
    periodMonth: false
    weekday: false
    startYear: false
    periodYear: false
    }
  1: {
    text: 'Monthly'
    startTime: true
    startDay: true
    periodDay: false
    startMonth: false
    periodMonth: false
    weekday: false
    startYear: false
    periodYear: false
    }
  2: {
    text: 'Yearly'
    startTime: true
    startDay: true
    periodDay: false
    startMonth: true
    periodMonth: false
    weekday: false
    startYear: false
    periodYear: false
    }
  3: {
    text: 'Weekdays'
    startTime: true
    startDay: false
    periodDay: false
    startMonth: false
    periodMonth: false
    weekday: true
    startYear: false
    periodYear: false
    }
  4: {
    text: 'Period Days'
    startTime: true
    startDay: true
    periodDay: true
    startMonth: false
    periodMonth: false
    weekday: false
    startYear: false
    periodYear: false
    }
  5: {
    text: 'Period Months'
    startTime: true
    startDay: true
    periodDay: false
    startMonth: true
    periodMonth: true
    weekday: false
    startYear: false
    periodYear: false
    }
  6: {
    text: 'Period Years'
    startTime: true
    startDay: true
    periodDay: false
    startMonth: true
    periodMonth: false
    weekday: false
    startYear: true
    periodYear: true
    }
}

Lists.Inventory.Status = {
  'active': 'Active'
  'obsolete': 'Obsolete'
  'pending': 'Pending'
  'unsafe': 'Unsafe'
}

Lists.Companies.Status = {
  'active': 'Active'
  'obsolete': 'Obsolete'
  'pending': 'Pending'
  'banned': 'Banned'
}

Lists.Companies.Type = {
  'internal': 'Internal Business'
  'supplier': 'Supplier'
  'customer': 'Customer'
  'both': 'Supplier and Customer'
}

Lists.Months = ['January','February','March','April','May','June','July','August','September','October','November','December']

Lists.Purchases.Status = {
  0: 'Req Cancelled'
  1: 'Req Started'
  2: 'Req Returned'
  3: 'Req Accepted'
  4: 'Purchase Order Created'
  5: 'Purchase Order Approved'
  6: 'Goods Received'
  7: 'Financially Closed'
  8: 'Purchase Order Closed'
}

Lists.Purchases.Types = {
  'workorder': 'For Work Order'
  'spare': 'Spare Replacement'
  'consumable': 'Consumable Replenishment'
  'capital': 'For Capital Work Order'
  'rd': 'Research and Development'
  'sample': 'Sample'
}
