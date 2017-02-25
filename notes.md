Notes for development

Sprint 1: 
Implement LinkRequest, SterrenLink,

TODO add specs!


TODO Create model sterrenLINK !!
( init with query params ? )
get the correct article with pv

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
- [ ] Update: LinkRequest.sterrenlink_sent_at
- [ ] NICE: coloured views for dead

UserMailer:



NIET VERGETEN
- date format in LInkR view
- coloured dates in LinkR view
- Deadline in LinkR view
- Stats
- add form_uid to sterrenlink

- cache like meetup cache to get all the results
- UserMailer blocks : bepaalde tekst bij bepaalde input





