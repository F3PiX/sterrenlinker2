Notes for development
18/4
- add article 'de' to patient org param (PR #19)
- removed all articles from TypeForm questionnaire (v1_2)
- bring updating logic back to the LinkRequest ()


17/4 
Created a project on GitHub 
Sprint 1 is done:
- LinkRequest: form to be filled in with data from typeform-notification
- Use of a Form enables editing the data for the 
hidden fields in the Typeform Questionnaire
- Sterrenlink is created automattically, in an 'after_create'
callback. The params come from the Link request.
- An email with the Sterrenlink is sent to the requester 
(= researcher)  
- TEMP: my own emailadres, to adjust the mail


7/4
1) deleted the first sterrenlinks migration:
class CreateSterrenlinks < ActiveRecord::Migration[5.0]
  def change
    create_table :sterrenlinks do |t|
      t.string :output_link
      t.string :oz
      t.string :pv
      t.string :applicant
      t.belongs_to :link_request, foreign_key: true

      t.timestamps
    end
  end
end

2) followed rails guide to add a second model, upto 6.4, the part where the new comments form 
is created on the article show page. 


Sprint 1: 
Implement LinkRequest, SterrenLink,

TODO Create model sterrenLINK !!
( init with query params ? )

- proberen:
Sterrenlink belongs_to LinkRequest.
Kan je dan doen: researcher = @link_request.researcher

`$ rails g model Sterrenlink output_link:string oz:string pv:string applicant:string link_request:belongs_to `


- [ ] Button in LR table: create Sterrenlink
???
On nested form:
https://currentricity.wordpress.com/2011/09/04/the-definitive-guide-to-accepts_nested_attributes_for-a-model-in-rails-3/

- [ ] Output: de link
- [ ] Input van LinkR, edit to edit ugly inputs
- [ ] NICE: edit voorzetsel bij pv (helper class?)
- [x] Update: LinkRequest.sterrenlink_sent_at
- [ ] NICE: coloured views for deadline

UserMailer:



NIET VERGETEN
- [x] date format in LInkR view
- [ ] coloured dates in LinkR view
- [ ] Deadline in LinkR view
- [ ] Stats
- [x] add form_uid to sterrenlink

- [ ] cache like meetup cache to get all the results
- [ ] UserMailer blocks : bepaalde tekst bij bepaalde input





