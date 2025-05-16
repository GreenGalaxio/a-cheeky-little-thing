// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.mmselect_107

package megaman_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class mmselect_107 extends MovieClip 
    {

        public var self:*;

        public function mmselect_107()
        {
            addFrameScript(0, this.frame1, 35, this.frame36);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame36():*
        {
            gotoAndPlay("again");
        }


    }
}//package megaman_fla

