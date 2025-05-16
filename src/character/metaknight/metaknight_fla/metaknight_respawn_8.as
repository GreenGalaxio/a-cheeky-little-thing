// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//metaknight_fla.metaknight_respawn_8

package metaknight_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class metaknight_respawn_8 extends MovieClip 
    {

        public var self:*;

        public function metaknight_respawn_8()
        {
            addFrameScript(0, this.frame1, 149, this.frame150);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame150():*
        {
            stop();
        }


    }
}//package metaknight_fla

