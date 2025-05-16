// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.sonic_duck_168

package sonic_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class sonic_duck_168 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function sonic_duck_168()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 5, this.frame6);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame5():*
        {
            stop();
        }

        internal function frame6():*
        {
            this.gotoAndStop("stopped");
        }


    }
}//package sonic_fla

