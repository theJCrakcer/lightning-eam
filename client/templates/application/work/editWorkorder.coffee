Template.editWorkorderPage.onRendered ->
  if !Collections.Workorders.Current.workTeam
    Collections.Workorders.Current.workTeam = []
  Session.set 'currentDoc', Collections.Workorders.Current
  $('.tooltipped').tooltip {delay: 50}

Template.editWorkorderPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.editWorkorderPage.helpers
  customTemplate: -> Customisations.viewAsset
  viewDoc: -> Session.get 'currentDoc'
  workorder: -> Collections.Workorders.Current.status > 2
  statusRequest: -> Collections.Workorders.Current.status
  editWorkorderSchema: -> Schema.requestsApproved

Template.editWorkorderPage.events
  'click .editWorkorder .btnSubmit': (e) ->
    Session.set 'currentDoc', Collections.Workorders.Current
    FlowRouter.go '/work/query'

Template.editRequestForm.helpers
  requestOptions: ->
    return {
      0: 'Request Cancelled'
      1: 'Request Started'
      2: 'Request Returned'
      3: 'Request Accepted'
    }

Template.editWorkorderForm.helpers
  workOptions: ->
    return {
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
  faultOptions: -> Lists.Workorders.Fault
  causeOptions: -> Lists.Workorders.Cause
  remedyOptions: -> Lists.Workorders.Remedy
  teamMembers: -> (Session.get 'currentDoc').workTeam
  safetyText: -> Session.get 'temp1'

Template.editWorkorderForm.events
  'click .editWorkorderForm .btnAdd': (e) ->
    MaterializeModal.display {
      bodyTemplate: 'editWorkorderFormAddUser'
      title: 'Add Team Member'
    }
  'click .editWorkorderForm .btnTemplate1': (e) ->
    MaterializeModal.display {
      bodyTemplate: 'editWorkorderFormSafetyTemplate'
      title: 'Create from Template'
    }
  'click .editWorkorderForm .btnTemplate2': (e) ->
    MaterializeModal.display {
      bodyTemplate: 'editWorkorderFormWorkTemplate'
      title: 'Create from Template'
    }

Template.editWorkorderFormAddUser.helpers
  settings: ->
    return {
      rowsPerPage: 10
      showFilter: true
      fields:  [
        { key: 'profile.firstName', label: ' First Name' }
        { key: 'profile.lastName', label: 'Last Name' }
        { key: 'profile.cpyName', label: 'Company' }
        { key: 'profile.cpyDiv', label: 'Division' }
        { key: 'location', label: 'Add Team Member', tmpl: Template.editWorkorderModalAddUser }
      ]
    }

Template.editWorkorderFormAddUser.events
  'click .editWorkorderForm .btnEach': (e) ->
    temp = {
      userID: this._id
      firstName: this.profile.firstName
      lastName: this.profile.lastName
    }
    # Check if not already added
    added = $.grep Collections.Workorders.Current.workTeam, (a) ->
      return a.userID == temp.userID
    if added.length>0
      MaterializeModal.alert title: "Error", message: "Person already in team."
      return
    # Add user to team
    if Collections.Workorders.Current.workTeam&&Collections.Workorders.Current.workTeam.length!=0
      Collections.Workorders.Current.workTeam.push(temp)
    else
      Collections.Workorders.Current.workTeam = []
      Collections.Workorders.Current.workTeam[0] = temp
    # Set session for reactivity
    Session.set 'currentDoc', Collections.Workorders.Current
    MaterializeModal.close()

Template.editWorkorderFormSafetyTemplate.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'safetyplans'

Template.editWorkorderFormSafetyTemplate.helpers
  safetyVal: -> Session.get 'temp1'
  safetyplanData: -> Safetyplans
  settingsSafety: ->
    return {
      rowsPerPage: 10
      showFilter: true
      fields:  [
        { key: 'text', label: ' Title' }
        { key: '', label: 'Add Safety Method Template', tmpl: Template.editWorkorderModalSafetyTemplate }
      ]
    }

Template.editWorkorderFormSafetyTemplate.events
  'click .editWorkorderForm .btnEach2': (e) ->
    temp = this._id
    Meteor.subscribe 'singleSafetymethod', this._id, {
      onReady: ->
        tempPlan = Safetyplans.findOne {_id: temp}
        Collections.Workorders.Current.safetyMethod = tempPlan.safetyMethod
        Session.set 'currentDoc', Collections.Workorders.Current
    }
    MaterializeModal.close()

Template.editWorkorderFormWorkTemplate.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'workplans'

Template.editWorkorderFormWorkTemplate.helpers
  workplanData: -> Workplans
  settingsWork: ->
    return {
      rowsPerPage: 10
      showFilter: true
      fields:  [
        { key: 'text', label: ' Title' }
        { key: '', label: 'Add Work Plan Template', tmpl: Template.editWorkorderModalWorkTemplate }
      ]
    }

Template.editWorkorderFormWorkTemplate.events
  'click .editWorkorderForm .btnEach3': (e) ->
    temp = this._id
    Meteor.subscribe 'singleWorkplan', this._id, {
      onReady: ->
        tempPlan = Workplans.findOne {_id: temp}
        Collections.Workorders.Current.workPlan = tempPlan.workPlan
        Session.set 'currentDoc', Collections.Workorders.Current
    }
    MaterializeModal.close()
