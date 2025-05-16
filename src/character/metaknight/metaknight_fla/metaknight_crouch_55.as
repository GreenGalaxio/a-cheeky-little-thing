// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//metaknight_fla.metaknight_crouch_55

package metaknight_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class metaknight_crouch_55 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function metaknight_crouch_55()
        {
            addFrameScript(0, this.frame1, 5, this.frame6);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame6():*
        {
            this.gotoAndPlay("redo");
        }


    }
}//package metaknight_fla

