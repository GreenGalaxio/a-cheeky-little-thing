// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.Mario_SelectScreen_207

package mario_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class Mario_SelectScreen_207 extends MovieClip 
    {

        public var self:*;

        public function Mario_SelectScreen_207()
        {
            addFrameScript(0, this.frame1, 14, this.frame15);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame15():*
        {
            gotoAndPlay("again");
        }


    }
}//package mario_fla

