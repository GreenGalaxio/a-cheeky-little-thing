// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_powerstar

package 
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class kirby_powerstar extends MovieClip 
    {

        public function kirby_powerstar()
        {
            addFrameScript(0, this.frame1, 21, this.frame22);
        }

        internal function frame1():*
        {
            SSF2API.playSound("kirbytauntstar");
        }

        internal function frame22():*
        {
            stop();
            if (parent != null)
            {
                parent.removeChild(this);
            };
        }


    }
}//package 

